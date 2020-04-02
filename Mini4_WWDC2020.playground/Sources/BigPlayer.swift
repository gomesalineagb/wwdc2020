import Foundation
import SpriteKit

public class BigPlayer: SKSpriteNode,Player{
    let txt = SKTexture(imageNamed: "bigPlayer")
    
    init() {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: txt.size().width - 15, height: txt.size().height))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = PhysicCategory.bigPlayer
        self.physicsBody?.collisionBitMask = PhysicCategory.platform | PhysicCategory.middlePlayer | PhysicCategory.smallPlayer | PhysicCategory.box | PhysicCategory.movablePlatform
        self.physicsBody?.contactTestBitMask = PhysicCategory.door | PhysicCategory.button
        self.physicsBody?.friction = 1
        self.physicsBody?.velocity.dy = 0
        self.physicsBody?.restitution = 0.0
//        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.mass = Mass.big
        self.lightingBitMask = PhysicCategory.light
        
        let eye = SKSpriteNode(imageNamed: "eyesBig")
        self.addChild(eye)
        eye.lightingBitMask = 0
        eye.zPosition = 5
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func moveLeft() {
        self.position.x = self.position.x - 2
    }
    
    func moveRight() {
        self.position.x = self.position.x + 2
    }
    
    func moveUp() {
        if self.physicsBody?.velocity.dy == 0{
            self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 18500))
        }
    }
    func moveDown() {
        self.position.y = self.position.y - 5
    }
}
