import Foundation
import SpriteKit


public class Level: SKNode{
    var platforms = [Platform]()
    var thinPlatform: ThinPlatform?
    var door: Door!
    var box: Box?
    var button: Button?
    var movablePlatform: MovablePlatform?
    var smallPlayer: SmallPlayer!
    var middlePlayer: MiddlePlayer!
    var bigPlayer: BigPlayer!
    var arrow: SKSpriteNode!
    
    init(platforms: [Platform],posThinPlatform: [CGPoint]?, posDoor : CGPoint, posBox: CGPoint?, posButton: CGPoint?, posMovablePlatform: CGPoint?, posSmallPlayer: CGPoint, posMiddlePlayer: CGPoint, posBigPlayer: CGPoint) {
        super.init()
        self.platforms = platforms
        
        for platform in platforms{
            self.addChild(platform)
        }
        if posThinPlatform != nil{
            self.thinPlatform = ThinPlatform(posInitial: posThinPlatform?[0] as! CGPoint, posFinal: posThinPlatform?[1] as! CGPoint)
            self.addChild(self.thinPlatform!)
        }
        
        self.door = Door(pos: posDoor)
        self.addChild(self.door)
        
        if posBox != nil{
            self.box = Box(pos: posBox!)
            self.addChild(self.box!)
        }
        
        if posButton != nil{
            self.button = Button(pos: posButton!)
            self.addChild(self.button!)
        }
        
        if posMovablePlatform != nil{
            self.movablePlatform = MovablePlatform(pos: posMovablePlatform!)
            self.addChild(self.movablePlatform!)
        }
        
        self.smallPlayer = SmallPlayer()
        self.smallPlayer.position = posSmallPlayer
        self.addChild(self.smallPlayer)
        
        if self.smallPlayer.light.parent == nil{
            self.smallPlayer.addChild(self.smallPlayer.light)
        }
        
        self.middlePlayer = MiddlePlayer()
        self.middlePlayer.position = posMiddlePlayer
        self.addChild(self.middlePlayer)
        
        self.bigPlayer = BigPlayer()
        self.bigPlayer.position = posBigPlayer
        self.addChild(self.bigPlayer)
        
        self.arrow = SKSpriteNode(imageNamed: "arrow")
        self.addChild(self.arrow)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
