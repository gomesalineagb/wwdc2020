import Foundation
import SpriteKit

public class LevelData{
    var levels: [Level] = [
        
        /////////////////////////*Level 1*/////////////////////////
        .init(platforms: [Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: -60)),
                          Platform(txt: SKTexture(imageNamed: "level1Platform2"), pos: CGPoint(x: -271.5, y: 20)),
                          Platform(txt: SKTexture(imageNamed: "level1Platform1"), pos: CGPoint(x: -351.5, y: 96)),
                          Platform(txt: SKTexture(imageNamed: "level1Platform3"), pos: CGPoint(x: -95.5, y: 94)),
                          Platform(txt: SKTexture(imageNamed: "level1Platform4"), pos: CGPoint(x: 183.5, y: -156))],
            posThinPlatform: nil,
            posDoor : CGPoint(x: 316.5, y: -151),
            posBox: CGPoint(x: -74.5, y: 160),
            posButton: nil,
            posMovablePlatform: nil,
            posSmallPlayer: CGPoint(x: -150, y: -85),
            posMiddlePlayer: CGPoint(x: -202, y: -184),
            posBigPlayer: CGPoint(x: -308.5, y: -168)),
    
    /////////////////////////*Level 2*/////////////////////////
        .init(platforms: [Platform(txt: SKTexture(imageNamed: "level2Platform1"), pos: CGPoint(x: -72.5, y: -175)),
                          Platform(txt: SKTexture(imageNamed: "level2Platform2"), pos: CGPoint(x: -302, y: 54))],
            posThinPlatform: [CGPoint(x: 205.5, y: 6), CGPoint(x: 209.5, y: -430)],
            posDoor : CGPoint(x: 316.5, y: -151),
            posBox: CGPoint(x: -302.5, y: 96),
            posButton: CGPoint(x: 42.5, y: -202),
            posMovablePlatform: nil,
            posSmallPlayer: CGPoint(x: -150, y: 0),
            posMiddlePlayer: CGPoint(x: -202, y: -184),
            posBigPlayer: CGPoint(x: -308.5, y: -168)),
        
        /////////////////////////*Level 3*/////////////////////////
        .init(platforms: [Platform(txt: SKTexture(imageNamed: "level3platform1"), pos: CGPoint(x: -204.5, y: -107)),
                          Platform(txt: SKTexture(imageNamed: "level3platform2"), pos: CGPoint(x: 59.5, y: 10)),
                          Platform(txt: SKTexture(imageNamed: "level3platform3"), pos: CGPoint(x: 312.5, y: 104))],
            posThinPlatform: [CGPoint(x: 149.5, y: -203), CGPoint(x: 149.5, y: -413)],
            posDoor : CGPoint(x: 316.5, y: -151),
            posBox: CGPoint(x: 128.5, y: 46),
            posButton: CGPoint(x: 220.5, y: 29),
            posMovablePlatform: CGPoint(x: -113.5, y: 100),
            posSmallPlayer: CGPoint(x: -330, y: -142),
            posMiddlePlayer: CGPoint(x: -370, y: -184),
            posBigPlayer: CGPoint(x: -262, y: -168)),
    ]
    
}
