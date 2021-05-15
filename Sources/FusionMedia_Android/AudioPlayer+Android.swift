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
    self.player = MediaPlayer()
    self.listener = MediaPlayerListener()        
            
    self.player?.setOnPreparedListener(listener: listener)
    self.player?.setDataSource(path: url.absoluteString)
    self.player?.prepareAsync()
  }     
}

extension AudioPlayer: AudioPlayerProtocol {
  	public func play() {
    	guard let isPlaying = self.player?.isPlaying(), !isPlaying else { return }
    
		self.player?.start()
  	}
  
  	public func stop() {
   	 	if (player?.isPlaying()) {      		player?.pause()    	}
  	}
  
  	public func isPlaying() -> Bool {
  		return player?.isPlaying()
  	}
  
    public func getDuration() -> Double {
        guard let player = player else { return 0 }
        return Double(player.getDuration)
    }
    
    public func setProgress(_ progress: Float) {
        guard let player = player else { return }
        player.seekTo(player.getDuration() * Int(progress))
    }
      
    public func getProgress(_ progress: @escaping (_ progress: Float) -> Void) {

    }
    
    public func setVolume(_ volume: Float) {
        guard let player = player else { return }
        player.setVolume(volume, volume)
    }
    
    public func getVolume() -> Float {
        guard let player = player else { return 0 }
        return player.volume
    }
}

class MediaPlayerListener: Object, MediaPlayer.OnPreparedListener {  
  func onPrepared(mp: MediaPlayer?) {     
//    mp?.start();
  }
}