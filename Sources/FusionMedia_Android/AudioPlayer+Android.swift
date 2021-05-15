import Java
import Foundation
import AndroidMedia
import FusionMedia_Common


public class AudioPlayer {
  	let url: URL
  	var player: MediaPlayer? = nil
  	var volume: Float = 1.0
   
  	private var listener: MediaPlayerListener? = nil
  
  	public required init(url: URL) {
    	self.url = url
    	self.player = MediaPlayer()
    	self.listener = MediaPlayerListener()
    
    	self.player?.setVolume(leftVolume: volume, rightVolume: volume)            
    	self.player?.setOnPreparedListener(listener: listener)
    	self.player?.setDataSource(path: url.absoluteString)
    	self.player?.prepareAsync()
  	}     
}

extension AudioPlayer: AudioPlayerProtocol {    
  	public func play() {
    	guard let player = self.player, !player.isPlaying() else { return }

		player.start()
  	}
  
  	public func stop() {
        guard let player = player else { return }
   	 	if player.isPlaying() {
      		player.pause()
    	}
  	}
  
  	public func isPlaying() -> Bool {
        guard let player = player else { return false }  	
  		return player.isPlaying()
  	}
  
    public func getDuration() -> Double {
        guard let player = player else { return 0 }
        return Double(player.getDuration())
    }
    
    public func setProgress(_ progress: Float) {
        guard let player = player else { return }
        player.seekTo(msec: Int32(Float(self.getDuration()) * progress))
    }
      
    public func getProgress() -> Float {
    	guard let player = player else { return 0 }
		return Float(player.getCurrentPosition()) / Float(self.getDuration())
    }
    
    public func setVolume(_ volume: Float) {
        guard let player = player else { return }
        player.setVolume(leftVolume: volume, rightVolume: volume)
        self.volume = volume
    }
    
    public func getVolume() -> Float {
        return volume
    }
}

class MediaPlayerListener: Object, MediaPlayer.OnPreparedListener {  
  func onPrepared(mp: MediaPlayer?) {     
//    mp?.start();
  }
}