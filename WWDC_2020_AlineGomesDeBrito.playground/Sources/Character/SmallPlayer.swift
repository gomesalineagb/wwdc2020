import Foundation
import SpriteKit

public class SmallPlayer: SKSpriteNode,Player{
    let txt = SKTexture(imageNamed: "smallPlayer")
    let light = Light()
    let eye = SKSpriteNode(imageNamed: "eyesSmall")
    
    public init() {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: txt.size().width, height: txt.size().height))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = PhysicCategory.smallPlayer
        self.physicsBody?.contactTestBitMask = PhysicCategory.door | PhysicCategory.button
        self.physicsBody?.collisionBitMask = PhysicCategory.platform | PhysicCategory.bigPlayer | PhysicCategory.middlePlayer | PhysicCategory.box | PhysicCategory.movablePlatform
        self.physicsBody?.mass = Mass.small
        self.physicsBody?.friction = 10
        self.physicsBody?.restitution = 0.0
        
        self.eye.position = CGPoint(x: 0, y: -5)
        self.eye.zPosition = 10
        self.eye.run(.repeatForever(.sequence([.animate(with: [SKTexture(imageNamed: "eyesSmall"),SKTexture(imageNamed: "eyesSmall1"),SKTexture(imageNamed: "eyesSmall2"),SKTexture(imageNamed: "eyesSmall")], timePerFrame: 0.2),.wait(forDuration: 4)])))
        
        self.addChild(self.eye)
        self.addChild(self.light)
    }
    func removeLight(){
        if self.light.parent != nil{
            self.light.removeFromParent()
        }
    }
    
    func moveLeft() {
        self.position.x = self.position.x - 2
    }
    
    func moveRight() {
        self.position.x = self.position.x + 2
    }
    
    func moveUp() {
        self.position.y = self.position.y + 2
    }
    
    func moveDown() {
        self.position.y = self.position.y - 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
