import Foundation
import SpriteKit

public class Button: SKSpriteNode{
    
    let txt = SKTexture(imageNamed: "button1")
    
    init(pos: CGPoint) {
        super.init(texture: txt, color: .clear, size: txt.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.txt.size().width - 20, height: self.txt.size().height - 5))
        self.position = pos
        self.lightingBitMask = PhysicCategory.light
        self.physicsBody?.categoryBitMask = PhysicCategory.button
        self.physicsBody?.collisionBitMask = PhysicCategory.platform
        self.physicsBody?.contactTestBitMask = PhysicCategory.bigPlayer | PhysicCategory.middlePlayer | PhysicCategory.box | PhysicCategory.movablePlatform
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.friction = 1
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = false
        self.zPosition = -1
    }
    
    func buttonPressed(pressed: Bool){
        if pressed{
            self.texture = SKTexture(imageNamed: "button2")            
        }else{
            self.texture = SKTexture(imageNamed: "button1")
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

