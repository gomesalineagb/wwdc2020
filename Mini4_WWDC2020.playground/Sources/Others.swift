import Foundation
import SpriteKit

struct Constants{
    static let sizeEdge = 30
    static let height = 480
    static let width = 800
    
}

struct Mass{
    static let small    :CGFloat = 0.05
    static let middle   :CGFloat = 20
    static let big      :CGFloat = 50
    static let box      :CGFloat = 20
    static let movable  :CGFloat = 50
    
}

struct Level{
    static let level1 = 1
    static let level2 = 2
    static let level3 = 3
}

protocol Player: SKSpriteNode{
    func moveLeft()
    func moveRight()
    func moveUp()
    func moveDown()
}

struct PhysicCategory{
    static let platform:        UInt32 = 0b1
    static let movablePlatform: UInt32 = 0b10
    static let box:             UInt32 = 0b100
    static let door:            UInt32 = 0b1000
    static let button:          UInt32 = 0b10000
    static let smallPlayer:     UInt32 = 0b100000
    static let middlePlayer:    UInt32 = 0b1000000
    static let bigPlayer:       UInt32 = 0b10000000
    static let light:           UInt32 = 0b100000000
}
