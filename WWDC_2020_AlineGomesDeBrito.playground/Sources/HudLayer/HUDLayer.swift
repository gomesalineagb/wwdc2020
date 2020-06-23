import Foundation
import SpriteKit

public class HUDLayer: SKNode{
    
    var label = SKLabelNode(text: "")
    var restart = SKSpriteNode(imageNamed: "restart")
    var play = SKSpriteNode(imageNamed: "play")
    var eyes = SKSpriteNode(imageNamed: "eyesBig")
    
    public override init() {
        super.init()
        self.label.zPosition = 10
        self.label.fontName = "AvenirNext"
        self.eyes.position = CGPoint(x: -10, y: 0)
        self.play.addChild(self.eyes)
        
        self.eyes.run(.repeatForever(.sequence([.animate(with: [SKTexture(imageNamed: "eyesBig"),SKTexture(imageNamed: "eyesBig1"),SKTexture(imageNamed: "eyesBig2"),SKTexture(imageNamed: "eyesBig")], timePerFrame: 0.2),.wait(forDuration: 4)])))
        
        self.restart.zPosition = 10
        self.restart.position = CGPoint(x: 0, y: 225)
        self.restart.isHidden = true
        self.addChild(self.restart)
        
        self.play.zPosition = 10
        self.addChild(self.play)
    }
    
    func updateGameState(gameState: GameState,level: Int){
        switch gameState{
        case .initial:
            self.hiddenAll()
            self.play.isHidden = false
        case .nextLevel:
            self.hiddenAll()
            self.restart.isHidden = false
            if level != 4{
                self.add(message: "Level \(level)", pos: .zero,size: 100)
            }
        case .restart:
            self.add(message: "Restart", pos: .zero,size: 100)
        case .tutorial:
            self.hiddenAll()
        default:
            break
        }
    }
    
    func hiddenAll(){
        for child in children {
            child.isHidden = true
        }
    }
    
    func add(message: String, pos: CGPoint,size: CGFloat){
        let new = self.label.copy() as! SKLabelNode
        new.text = message
        new.fontSize = size
        new.fontColor = .black
        new.position = pos
        let fadeOut = SKAction.fadeOut(withDuration: 3.5)
        let remove = SKAction.run {
            new.removeFromParent()
        }
        self.addChild(new)
        new.run(.sequence([fadeOut,remove]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
