import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    var hud = HUDLayer()
    let wall = Wall()
    
    var level: Level!
    
    var currentPlayer: Player?
    var currentLevel: Int!
    
    var gameState: GameState!{
        didSet {
            self.updateGameState()
        }
    }
    
    /*Is character moving?*/
    var movingRight = false
    var movingLeft = false
    var movingUP = false
    var movingDown = false
    
    override public func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        self.level = LevelData().levels[0]
        self.currentPlayer = self.level.middlePlayer
        
        self.currentLevel = Levels.initial
        self.gameState = .initial
        
        self.addChild(self.wall)
        self.addChild(self.hud)
       
    }
    
    func start(){
        MusicHandler.sharedHandler.setupBackgroundMusic(nameSong: "backgroundMenu")
    }
    
    func restart(){
        self.level.removeAllChildren()
        self.loadLevel()
    }
    
    func updateGameState(){
        switch gameState {
        case .initial:
            self.start()
        case .nextLevel:
            self.currentLevel += 1
            self.nextLevel()
        case .restart:
            self.restart()
        default:
            break
        }
        self.hud.updateGameState(gameState: gameState, level: self.currentLevel)
    }
    
    /*Removes all and calls the next level**/
    func nextLevel(){
        MusicHandler.sharedHandler.audioPlayer?.stop()
        
        if self.currentLevel == 1{
            self.loadLevel()
        }else{
            MusicHandler.sharedHandler.playSoundEffect(nameSong: "lightOn")
            self.level.smallPlayer.removeLight()
            let transition = SKAction.run {
                self.level.removeFromParent()
                self.loadLevel()
            }
            
            self.run(.sequence([.wait(forDuration: 2),transition]))
        }
    }
    
    /*Call the level**/
    func loadLevel(){
        MusicHandler.sharedHandler.setupBackgroundMusic(nameSong: "backgroundLevel")
        
        switch self.currentLevel {
        case Levels.level1, Levels.level2, Levels.level3:
            MusicHandler.sharedHandler.playSoundEffect(nameSong: "lightOn")
            self.level = LevelData().levels[self.currentLevel - 1]
            self.currentPlayer = self.level.middlePlayer
            self.addChild(self.level)
        case 4:
            self.gameState = .initial
            self.currentLevel = Levels.initial
        default:
            break
        }
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    override public func mouseDown(with event: NSEvent) {//restart, play,
        let location = event.location(in: self)
        if self.hud.restart.contains(location){
            self.gameState = .restart
        }
        if self.hud.play.contains(location){
            if self.gameState == .initial{
               self.gameState = .nextLevel
            }
        }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        
        if movingLeft{
            self.currentPlayer?.moveLeft()
        }
        if movingRight{
            self.currentPlayer?.moveRight()
        }
        if movingDown{
            self.currentPlayer?.moveDown()
        }
        if movingUP{
            self.currentPlayer?.moveUp()
        }
        self.level.arrow.position = CGPoint(x: self.currentPlayer!.position.x, y: self.currentPlayer!.position.y + self.currentPlayer!.size.height)
    }
    
    public override func keyDown(with event: NSEvent) {

        switch event.keyCode {
        case 126://up
            self.movingUP = true
        case 125://down
            self.movingDown = true
            break
        case 124://right
            self.movingRight = true
        case 123://left
            self.movingLeft = true
        case 12://q
            if self.currentPlayer!.isKind(of: MiddlePlayer.classForCoder()){
                self.currentPlayer = self.level.bigPlayer
            }else if self.currentPlayer!.isKind(of: BigPlayer.classForCoder()){
                self.currentPlayer = self.level.smallPlayer
            }else{
                self.currentPlayer = self.level.middlePlayer
            }
        default:
            break
        }
    }
    
    public override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 126://up
            self.movingUP = false
        case 125://down
            self.movingDown = false
            break
        case 124://right
            self.movingRight = false
        case 123://left
            self.movingLeft = false
        default:
            break
        }
    }
}


extension GameScene: SKPhysicsContactDelegate{
    public func didBegin(_ contact: SKPhysicsContact) {
        let buttonOrDoor = contact.bodyA.categoryBitMask == PhysicCategory.button || contact.bodyA.categoryBitMask == PhysicCategory.door ? contact.bodyA.node : contact.bodyB.node
        
        if let button = buttonOrDoor as? Button{
            button.buttonPressed(pressed: true)
            self.level.thinPlatform!.buttonPressed(pressed: true)
        }
        
        if let door = buttonOrDoor as? Door{
            let players = door.physicsBody?.allContactedBodies().filter({$0.categoryBitMask != PhysicCategory.platform})
            if players!.count == 3{
                door.open()
                door.physicsBody?.categoryBitMask = 0
                self.gameState = .nextLevel
            }
        }
    }
    public func didEnd(_ contact: SKPhysicsContact) {
        let button = contact.bodyA.categoryBitMask == PhysicCategory.button ? contact.bodyA.node : contact.bodyB.node
        
        if let button = button as? Button{
            if button.physicsBody?.allContactedBodies().count == 1 {
                button.buttonPressed(pressed: false)
                self.level.thinPlatform!.buttonPressed(pressed: false)
            }
        }
    }
}
