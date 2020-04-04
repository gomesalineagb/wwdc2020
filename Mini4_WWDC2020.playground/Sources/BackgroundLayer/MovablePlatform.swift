import Foundation
import SpriteKit

public class MovablePlatform: SKSpriteNode{
        
    let txt = SKTexture(imageNamed: "movablePlatform")
    
    init(pos: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.position = pos
        self.physicsBody = SKPhysicsBody(texture: self.txt, size: self.txt.size())
        self.lightingBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.platform
        self.physicsBody?.friction = 1
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.mass = Mass.movable
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

