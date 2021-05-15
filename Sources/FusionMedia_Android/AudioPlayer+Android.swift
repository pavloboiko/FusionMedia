import Java
import Foundation
import AndroidMedia
import FusionMedia_Common


public class AudioPlayer {
  	let url: URL
  	var player: MediaPlayer? = nil
  	var volume: Float = 1.0
  
    var timer:Timer!
    var trackProgress: ((Float) -> Void)?
  
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
    @objc func trackAudio() {
        guard let player = player else {
            trackProgress?(0)
            timer.invalidate()
            return
        }
        trackProgress?(player.getCurrentPosition() / Float(self.getDuration()))
        if !player.isPlaying {
            timer.invalidate()
        }
    }
    
  	public func play() {
    	guard let isPlaying = self.player?.isPlaying(), !isPlaying else { return }
    	timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(self.trackAudio), userInfo: nil, repeats: true)
		self.player?.start()
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
      
    public func getProgress(_ progress: @escaping (_ progress: Float) -> Void) {
        self.trackProgress = progress
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