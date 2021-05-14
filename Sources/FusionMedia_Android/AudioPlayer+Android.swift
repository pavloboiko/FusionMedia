import Java
import Foundation
import AndroidMedia
import FusionMedia_Common


public class AudioPlayer {
  let url: URL
  var player: MediaPlayer? = nil 
  
  private var listener: MediaPlayerListener? = nil
  
  public required init(url: URL) {
    self.url = url
  }     
}

extension AudioPlayer: AudioPlayerProtocol {
  public func play() {
    guard let isPlaying = self.player?.isPlaying(), !isPlaying else { return }
    
    self.player = MediaPlayer()
    self.listener = MediaPlayerListener()        
            
    self.player?.setOnPreparedListener(listener: listener)
    self.player?.setDataSource(path: url.absoluteString)
    self.player?.prepareAsync()
  }
}

class MediaPlayerListener: Object, MediaPlayer.OnPreparedListener {  
  func onPrepared(mp: MediaPlayer?) {     
    mp?.start();
  }
}