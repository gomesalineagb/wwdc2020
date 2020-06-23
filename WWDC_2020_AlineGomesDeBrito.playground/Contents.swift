/*:
# *A game about Collaboration*
  A platform game


## How to Play:
- Use your arrow keys **←↑→↓** to control the current character.
- Use your key **Q** to change the character.
- The arrow **⬇︎** indicates which character you are controlling.
- Navigate all the characters to the door in order to advance to the next level.
- You can Restart  the level by clicking at **⟳**

The objective of the game is to pass all levels, combining the different abilities of the characters.

Each Character has a different ability, you have to combine them to achieve the door, and all of this with the Light-Off 😜(hope you're not afraid of the dark 😳). *Try to use all the characters!*

## **Good Luck and Have Fun!**

 - Sounds Credits:
 
 "Light, Pulley Switch, On, B.wav" by InspectorJ (www.jshaw.co.uk) of Freesound.org
 
 "Rhythmic Game Menu Ambience" by PatrickLieberkind of Freesound.org
 
 "Background Theme 1" by Speedenza of Freesound.org
 */
import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 480))
if let scene = GameScene (fileNamed: "GameScene") {
 //   sceneView.showsPhysics = true
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

