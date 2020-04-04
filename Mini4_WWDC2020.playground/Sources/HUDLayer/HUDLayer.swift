import Foundation
import SpriteKit

public class HUDLayer: SKNode{
    
    var label = SKLabelNode(text: "hello world")
    var restart = SKSpriteNode(imageNamed: "restart")
    var play = SKSpriteNode(imageNamed: "play")
    
    public override init() {
        super.init()
        self.label.zPosition = 10
        self.label.isHidden = true
        self.addChild(self.label)
        
        self.restart.zPosition = 10
        self.restart.position = CGPoint(x: 0, y: 225)
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
            self.add(message: "Level \(level)", pos: .zero)
        case .restart:
            self.add(message: "Restart", pos: .zero)
        case .tutorial:
            self.hiddenAll()
            self.add(message: "Click Space to continue", pos: .zero)
        default:
            break
        }
    }
    
    func hiddenAll(){
        for child in children {
            child.isHidden = true
        }
    }
    
    func add(message: String, pos: CGPoint){
        self.label.isHidden = false
        self.label.text = message
        self.label.fontSize = 100
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        self.label.run(.sequence([fadeIn,.wait(forDuration: 1),fadeOut]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
