import FusionMedia_Common
import AVFoundation

public class AudioPlayer {
  let url: URL    
  var player: AVAudioPlayer? = nil  
  
  public required init(url: URL) {
    self.url = url    
  }
}


extension AudioPlayer: AudioPlayerProtocol {
  public func play() {
    player = try? AVAudioPlayer(contentsOf: self.url)
    player?.prepareToPlay()
    player?.play()

  }
}