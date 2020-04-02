import Foundation
import SpriteKit

public class SmallPlayer: SKSpriteNode,Player{
    let txt = SKTexture(imageNamed: "smallPlayer")
    let light = Light()
    
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
        self.physicsBody?.restitution = 0
        self.addChild(self.light)
//        self.physicsBody?.usesPreciseCollisionDetection = true
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
