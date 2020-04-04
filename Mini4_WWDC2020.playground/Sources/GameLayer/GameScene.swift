import Foundation
import SpriteKit

public class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var hud = HUDLayer()

    //player node
    let smallPlayer = SmallPlayer()
    let middlePlayer = MiddlePlayer()
    let bigPlayer = BigPlayer()
    let wall = Wall()
    let door = Door(pos: CGPoint(x: 316.5, y: -151))
    var level = SKNode()
    
    var currentPlayer: Player?
    var currentLevel = 0{
        didSet{
            print("level: ",currentLevel)//deu loop
        }
    }
    
    var gameState: GameState = .initial {
        didSet {
            self.updateGameState()
        }
    }
    
    let arrow = SKSpriteNode(imageNamed: "arrow")
    
    var movingRight = false
    var movingLeft = false
    var movingUP = false
    var movingDown = false
    
    override public func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
                
        self.currentPlayer = middlePlayer
        self.currentLevel = 0
//        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(self.level)
        self.gameState = .initial
        self.addChild(wall)
        self.addChild(self.hud)
        
        self.arrow.lightingBitMask = PhysicCategory.light
    }
        
    func level1(){
        
        let platforms = [Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: -60)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform2"), pos: CGPoint(x: -271.5, y: 20)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: 96)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform3"), pos: CGPoint(x: -95.5, y: 94)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform4"), pos: CGPoint(x: 183.5, y: -156))]

        self.door.position = CGPoint(x: 316.5, y: -151)
        
        let box = Box(pos: CGPoint(x: -74.5, y: 160))
        
        self.smallPlayer.position = CGPoint(x: -150, y: -85)
        self.bigPlayer.position = CGPoint(x: -308.5, y: -168)
        self.middlePlayer.position = CGPoint(x: -202, y: -184)
        
        for platform in platforms {
            self.level.addChild(platform)
        }
        if self.smallPlayer.light.parent == nil{
            self.smallPlayer.addChild(self.smallPlayer.light)
        }
        self.level.addChild(box)
        
        self.addChild(middlePlayer)
        self.addChild(bigPlayer)
        self.addChild(smallPlayer)
        self.addChild(door)
        self.addChild(arrow)
    }
    
    func level2(){
        
        let platforms = [Platform(txt: SKTexture(imageNamed: "level2Platform1"), pos: CGPoint(x: -72.5, y: -173)),
                         Platform(txt: SKTexture(imageNamed: "level2Platform2"), pos: CGPoint(x: -302, y: 58))]

        self.door.position = CGPoint(x: 316.5, y: -151)
        
        let box = Box(pos: CGPoint(x: -302.5, y: 96))
        
        let button = Button(pos: CGPoint(x: 42.5, y: -202))
        
        let thinPlatform = ThinPlatform(posInitial: CGPoint(x: 205.5, y: 6), posFinal: CGPoint(x: 209.5, y: -430))
        thinPlatform.name = "thinPlatform"
        
        self.smallPlayer.position = CGPoint(x: -150, y: 0)
        self.bigPlayer.position = CGPoint(x: -308.5, y: -168)
        self.middlePlayer.position = CGPoint(x: -202, y: -184)
        
        for platform in platforms {
            self.level.addChild(platform)
        }
        self.level.addChild(box)
        self.level.addChild(button)
        self.level.addChild(thinPlatform)
        if self.smallPlayer.light.parent == nil{
            self.smallPlayer.addChild(self.smallPlayer.light)
        }
    }
    
    func level3(){
        
        let platforms = [Platform(txt: SKTexture(imageNamed: "level3platform1"), pos: CGPoint(x: -204.5, y: -107)),
                         Platform(txt: SKTexture(imageNamed: "level3platform2"), pos: CGPoint(x: 59.5, y: 10)),
                         Platform(txt: SKTexture(imageNamed: "level3platform3"), pos: CGPoint(x: 312.5, y: 104))]

        self.door.position = CGPoint(x: 316.5, y: -151)
        
        let box = Box(pos: CGPoint(x: 128.5, y: 46))
        
        let button = Button(pos: CGPoint(x: 220.5, y: 29))
        
        let thinPlatform = ThinPlatform(posInitial: CGPoint(x: 149.5, y: -203), posFinal: CGPoint(x: 149.5, y: -413))
        thinPlatform.name = "thinPlatform"
        
        let movablePlatform = MovablePlatform(pos: CGPoint(x: -113.5, y: 100))
        
        self.smallPlayer.position = CGPoint(x: -330, y: -142)
        self.bigPlayer.position = CGPoint(x: -262, y: -168)
        self.middlePlayer.position = CGPoint(x: -370, y: -184)
        
        for platform in platforms {
            self.level.addChild(platform)
        }
        self.level.addChild(box)
        self.level.addChild(button)
        self.level.addChild(thinPlatform)
        self.level.addChild(movablePlatform)
        if self.smallPlayer.light.parent == nil{
            self.smallPlayer.addChild(self.smallPlayer.light)
        }
    }
    
    func win(){
        self.start()
    }
    
    func start(){//com label explicando a missao do jogador,e como se joga
        print("ta no inicio")
    }
    
    func restart(){
        self.level.removeAllChildren()
        self.loadLevel()
    }
    
    func tutorial(){
        
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
        case .tutorial:
            self.tutorial()
        default:
            break
        }
        self.hud.updateGameState(gameState: gameState, level: self.currentLevel)
    }
    
    func nextLevel(){//remove tudo, e chama o prox nivel
        
        self.smallPlayer.removeAllChildren()
        let transition = SKAction.run {
            self.level.removeAllChildren()
            self.loadLevel()
        }
        
        self.run(.sequence([.wait(forDuration: 2),transition]))
        
    }
    
    func loadLevel(){
        switch self.currentLevel {
        case 1:
            self.level1()
        case 2:
            self.level2()
        case 3:
            self.level3()
        case 4:
            self.gameState = .initial
            self.currentLevel = 0
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
            self.gameState = .tutorial
        }
    }
    
    override public func mouseDragged(with event: NSEvent) {
    }
    
    override public func mouseUp(with event: NSEvent) {
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
        self.arrow.position = CGPoint(x: self.currentPlayer!.position.x, y: self.currentPlayer!.position.y + self.currentPlayer!.size.height)
    }
    
    public override func keyDown(with event: NSEvent) {
        
        //========================escolher o personagem
        //variavel de controle, verificar se esta jogando, pausado, etc...
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
        case 12://q===========================
            if self.currentPlayer!.isKind(of: MiddlePlayer.classForCoder()){
                self.currentPlayer = bigPlayer
            }else if self.currentPlayer!.isKind(of: BigPlayer.classForCoder()){
                self.currentPlayer = smallPlayer
            }else{
                self.currentPlayer = middlePlayer
            }
        case 49://space
            if self.gameState == .tutorial{
                self.gameState = .nextLevel
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

extension GameScene{
    public func didBegin(_ contact: SKPhysicsContact) {
        let buttonOrDoor = contact.bodyA.categoryBitMask == PhysicCategory.button || contact.bodyA.categoryBitMask == PhysicCategory.door ? contact.bodyA.node : contact.bodyB.node
        
        if let button = buttonOrDoor as? Button{
            button.buttonPressed(pressed: true)
            if let thinPlatform = self.childNode(withName: "thinPlatform") as? ThinPlatform{
                thinPlatform.buttonPressed(pressed: true)
            }
        }
        
        if let door = buttonOrDoor as? Door{
            let players = door.physicsBody?.allContactedBodies().filter({$0.categoryBitMask != PhysicCategory.platform})
            print(players!.count)
            if players!.count == 3{
                self.gameState = .nextLevel
            }
        }
    }
    public func didEnd(_ contact: SKPhysicsContact) {
        let button = contact.bodyA.categoryBitMask == PhysicCategory.button ? contact.bodyA.node : contact.bodyB.node
        
        if let button = button as? Button{
            button.buttonPressed(pressed: false)
            if let thinPlatform = self.childNode(withName: "thinPlatform") as? ThinPlatform{
                thinPlatform.buttonPressed(pressed: false)
            }
        }
    }
}
