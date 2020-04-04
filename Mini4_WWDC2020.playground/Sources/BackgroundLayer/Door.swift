import Foundation
import SpriteKit

public class Door: SKSpriteNode{
    
    let txt = SKTexture(imageNamed: "door")
    
    init(pos: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.txt.size().width, height: self.txt.size().height))
        self.position = pos
        self.lightingBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.door
        self.physicsBody?.collisionBitMask = PhysicCategory.platform
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.friction = 1
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = Mass.box
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

