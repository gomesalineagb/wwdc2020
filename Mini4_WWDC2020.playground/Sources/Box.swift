import Foundation
import SpriteKit

public class Box: SKSpriteNode{
    
    let txt = SKTexture(imageNamed: "box")
    
    init(pos: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.txt.size().width, height: self.txt.size().height))
        self.position = pos
        self.lightingBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.box
        self.physicsBody?.contactTestBitMask = PhysicCategory.button
        self.physicsBody?.collisionBitMask = PhysicCategory.bigPlayer | PhysicCategory.middlePlayer | PhysicCategory.smallPlayer | PhysicCategory.platform | PhysicCategory.movablePlatform | PhysicCategory.button
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.friction = 1
        self.physicsBody?.restitution = 0
        self.physicsBody?.mass = Mass.box
        self.zPosition = -1
        }

        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
