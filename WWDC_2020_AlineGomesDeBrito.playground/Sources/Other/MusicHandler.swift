import Foundation
import AVFoundation

public class MusicHandler {
    static let sharedHandler = MusicHandler()
    
    var audioPlayer: AVAudioPlayer?
    var soudEffectPlayer: AVAudioPlayer?
    
    func setupBackgroundMusic(nameSong: String){
        
        let url: URL? = Bundle.main.url(forResource: nameSong, withExtension: ".mp3")
        guard let urlMusic = url else {return}
        do{
            audioPlayer?.stop()
            
            audioPlayer = try AVAudioPlayer(contentsOf: urlMusic)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 1
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = -1
        }catch{
            print(error)
        }

    }
    
    func playSoundEffect(nameSong: String){
       
            let url: URL? = Bundle.main.url(forResource: nameSong, withExtension: ".mp3")
            guard let urlMusic = url else {return}
            do{
                soudEffectPlayer = try AVAudioPlayer(contentsOf: urlMusic)
                soudEffectPlayer?.prepareToPlay()
                soudEffectPlayer?.volume = 1
                soudEffectPlayer?.play()
            }catch{
                print(error)
            }
    }
}
