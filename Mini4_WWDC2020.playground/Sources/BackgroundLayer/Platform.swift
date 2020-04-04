import Foundation
import SpriteKit

public class Platform: SKSpriteNode{
        
    init(txt: SKTexture, pos: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        
        self.physicsBody = SKPhysicsBody(texture: txt, size: txt.size())
        self.position = pos
        self.lightingBitMask = PhysicCategory.light
        self.shadowCastBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.platform
//        self.physicsBody?.collisionBitMask = PhysicCategory.middlePlayer
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.friction = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
