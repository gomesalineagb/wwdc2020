//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit


let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 480))
if let scene = GameScene (fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
//    scene.scaleMode = .aspectFill
    sceneView.showsPhysics = true
    // Present the scene
    sceneView.presentScene(scene)
    
}


PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
