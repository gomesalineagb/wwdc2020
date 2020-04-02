import Foundation
import SpriteKit

public class GameScene: SKScene,SKPhysicsContactDelegate {
    
    //player node
    let smallPlayer = SmallPlayer()
    let middlePlayer = MiddlePlayer()
    let bigPlayer = BigPlayer()
    let wall = Wall()
//    let movablePlatform = SKSpriteNode(imageNamed: "movablePlatform")
    
    var currentPlayer: Player?
    var currentLevel = 1
    
    var movingRight = false
    var movingLeft = false
    var movingUP = false
    var movingDown = false
    
    
    
    override public func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
                
        self.currentPlayer = middlePlayer
        self.level2()
    }
        
    func level1(){
        
        let platforms = [Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: -60)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform2"), pos: CGPoint(x: -271.5, y: 20)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: 96)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform3"), pos: CGPoint(x: -95.5, y: 94)),
                            Platform(txt: SKTexture(imageNamed: "level1Platform4"), pos: CGPoint(x: 183.5, y: -156))]

        let door = Door(pos: CGPoint(x: 316.5, y: -151))
        
        let box = Box(pos: CGPoint(x: -74.5, y: 160))
        
        self.smallPlayer.position = CGPoint(x: -150, y: -85)
        self.bigPlayer.position = CGPoint(x: -308.5, y: -168)
        self.middlePlayer.position = CGPoint(x: -202, y: -184)
        
        for platform in platforms {
            self.addChild(platform)
        }
        
        self.addChild(middlePlayer)
        self.addChild(bigPlayer)
        self.addChild(smallPlayer)
        self.addChild(wall)
        
        self.addChild(door)
        self.addChild(box)
    }
    
    func level2(){
        
        let platforms = [Platform(txt: SKTexture(imageNamed: "level2Platform1"), pos: CGPoint(x: -72.5, y: -173)),
                         Platform(txt: SKTexture(imageNamed: "level2Platform2"), pos: CGPoint(x: -302, y: 58)),]

        let door = Door(pos: CGPoint(x: 316.5, y: -151))
        
        let box = Box(pos: CGPoint(x: -302.5, y: 96))
        
        let button = Button(pos: CGPoint(x: 42.5, y: -202))
        
        let thinPlatform = ThinPlatform(posInitial: CGPoint(x: 205.5, y: 6), posFinal: CGPoint(x: 209.5, y: -430))
        thinPlatform.name = "thinPlatform"
        
        self.smallPlayer.position = CGPoint(x: -150, y: 0)
        self.bigPlayer.position = CGPoint(x: -308.5, y: -168)
        self.middlePlayer.position = CGPoint(x: -202, y: -184)
        
        for platform in platforms {
            self.addChild(platform)
        }
        self.addChild(door)
        self.addChild(box)
        self.addChild(button)
        self.addChild(thinPlatform)
        
        self.addChild(middlePlayer)
        self.addChild(bigPlayer)
        self.addChild(smallPlayer)
        self.addChild(wall)
    }
    
    func level3(){
        
    }
    
    func uploadLevel(level: Int){//remove tudo, e chama o prox nivel
        self.smallPlayer.removeAllChildren()
        let transition = SKAction.run {
            self.removeAllChildren()
            self.level2()
        }
        
        self.run(.sequence([.wait(forDuration: 2),transition]))
        
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    override public func mouseDown(with event: NSEvent) {
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
            let players = door.physicsBody?.allContactedBodies().map({$0.categoryBitMask != PhysicCategory.platform})
            if players!.count == 3{
                self.uploadLevel(level: self.currentLevel + 1)
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
