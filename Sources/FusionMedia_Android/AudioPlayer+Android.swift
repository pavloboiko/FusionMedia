import Java
import Foundation
import AndroidMedia
import FusionMedia_Common


public class AudioPlayer {
  	let url: URL
  	var player: MediaPlayer? = nil
  	var localVolume: Float = 1.0
   
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
    public var isPlaying: Bool {
        guard let player = player else { return false }  	
  		return player.isPlaying()
    }
    
    public var duration: Double {
        guard let player = player else { return 0 }
        return Double(player.getDuration())
    }
    
    public var currentTime: Double {
        guard let player = player else { return 0 }
        return Double(player.getCurrentPosition())
    }
    
    public var volume: Float {
        get {
            return self.localVolume
        }
        set {
            guard let player = player else { return }
        	player.setVolume(leftVolume: newValue, rightVolume: newValue)            
            self.localVolume = newValue
        }
    }
    
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
  
 	public func seek(to: Double) {
        guard let player = player else { return }
        player.seekTo(msec: Int32(to))
    }
}

class MediaPlayerListener: Object, MediaPlayer.OnPreparedListener {  
  func onPrepared(mp: MediaPlayer?) {     
//    mp?.start();
  }
}