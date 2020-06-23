import Foundation
import SpriteKit

public class MiddlePlayer: SKSpriteNode,Player{
    
    let txt = SKTexture(imageNamed: "middlePlayer")
    let eye = SKSpriteNode(imageNamed: "eyesMiddle")
    
    init() {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: txt.size().width, height: txt.size().height))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = PhysicCategory.middlePlayer
        self.physicsBody?.contactTestBitMask = PhysicCategory.door | PhysicCategory.button
        self.physicsBody?.collisionBitMask = PhysicCategory.platform | PhysicCategory.bigPlayer | PhysicCategory.smallPlayer | PhysicCategory.box | PhysicCategory.movablePlatform
        self.physicsBody?.friction = 1
        self.physicsBody?.velocity.dy = 0
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.mass = Mass.middle
        self.lightingBitMask = PhysicCategory.light
        
        self.eye.lightingBitMask = 0
        self.eye.zPosition = 5
        self.eye.run(.repeatForever(.sequence([.animate(with: [SKTexture(imageNamed: "eyesMiddle"),SKTexture(imageNamed: "eyesMiddle1"),SKTexture(imageNamed: "eyesMiddle2"),SKTexture(imageNamed: "eyesMiddle")], timePerFrame: 0.2),.wait(forDuration: 3.5)])))
        self.addChild(self.eye)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft() {
        self.position.x = self.position.x - 5
    }
    
    func moveRight() {
        self.position.x = self.position.x + 5
    }
    
    func moveUp() {
        if self.physicsBody!.velocity.dy >= 0 && self.physicsBody!.velocity.dy <= 1{
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 11000))
        }
    }
    
    func moveDown() {
        self.position.y = self.position.y - 5
    }
}
