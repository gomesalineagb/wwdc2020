import Foundation
import SpriteKit

public class Light: SKLightNode{
    
    public override init() {
        super.init()
        self.shadowColor = .black
        self.lightColor = .white
        self.falloff = 3
        self.categoryBitMask = PhysicCategory.light
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
