import Foundation
import SpriteKit

public class ThinPlatform: SKSpriteNode{
    
    let txt = SKTexture(imageNamed: "thinPlatform")
    var posInitial: CGPoint!
    var posFinal: CGPoint!
    
    init(posInitial: CGPoint, posFinal: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.posInitial = posInitial
        self.posFinal = posFinal
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.txt.size().width, height: self.txt.size().height))
        self.position = posInitial
        self.lightingBitMask = PhysicCategory.light
        self.shadowCastBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.platform
        self.physicsBody?.collisionBitMask = PhysicCategory.middlePlayer
        self.physicsBody?.isDynamic = false
        self.physicsBody?.friction = 1
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = false
    }
    
    func buttonPressed(pressed: Bool){
        if pressed{
            self.removeAction(forKey: "up")
            self.run(.moveTo(y: self.posFinal.y, duration: 1),withKey: "down")
        }else{
            self.removeAction(forKey: "down")
            self.run(.moveTo(y: self.posInitial.y, duration: 0.5),withKey: "up")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
