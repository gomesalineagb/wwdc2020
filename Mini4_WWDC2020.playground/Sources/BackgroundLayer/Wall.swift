import Foundation
import SpriteKit

public class Wall: SKSpriteNode{
    
    let txt = SKTexture(imageNamed: "wall")
        
    init() {
        super.init(texture: txt, color: .clear, size: txt.size())

        self.physicsBody = SKPhysicsBody(bodies:[
            SKPhysicsBody(edgeFrom: CGPoint(x: -Constants.width / 2 + Constants.sizeEdge, y: -Constants.height/2 + Constants.sizeEdge), to: CGPoint(x: Constants.width/2 - Constants.sizeEdge, y: -Constants.height/2 + Constants.sizeEdge)),
            SKPhysicsBody(edgeFrom: CGPoint(x: -Constants.width / 2 + Constants.sizeEdge, y: -Constants.height/2 + Constants.sizeEdge), to: CGPoint(x: -Constants.width / 2 + Constants.sizeEdge, y: Constants.height/2 - Constants.sizeEdge)),
            SKPhysicsBody(edgeFrom: CGPoint(x: -Constants.width / 2 + Constants.sizeEdge, y: Constants.height/2 - Constants.sizeEdge), to: CGPoint(x: Constants.width/2 - Constants.sizeEdge, y: Constants.height/2 - Constants.sizeEdge)),
            SKPhysicsBody(edgeFrom: CGPoint(x: Constants.width / 2 - Constants.sizeEdge, y: -Constants.height/2 + Constants.sizeEdge), to: CGPoint(x: Constants.width / 2 - Constants.sizeEdge, y: Constants.height/2 - Constants.sizeEdge))])
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.friction = 1
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.lightingBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.platform
        self.physicsBody?.collisionBitMask = PhysicCategory.bigPlayer | PhysicCategory.smallPlayer | PhysicCategory.middlePlayer | PhysicCategory.movablePlatform | PhysicCategory.button
        self.physicsBody?.mass = 100
        self.zPosition = -10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

