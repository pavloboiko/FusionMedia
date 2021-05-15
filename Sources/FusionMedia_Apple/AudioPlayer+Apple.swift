import FusionMedia_Common
import AVFoundation

public class AudioPlayer {
    let url: URL
    var player: AVAudioPlayer? = nil
    
    public required init(url: URL) {
        self.url = url
        
        player = try? AVAudioPlayer(contentsOf: self.url)
        player?.prepareToPlay()
    }
}


extension AudioPlayer: AudioPlayerProtocol {
    public func play() {
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func isPlaying() -> Bool {
        guard let player = player else { return false }
        return player.isPlaying
    }
    
    public func getDuration() -> Double {
        guard let player = player else { return 0 }
        return player.duration
    }
    
    public func setProgress(_ progress: Float) {
        guard let player = player else { return }
        let isPlaying = player.isPlaying
        player.stop()
        player.currentTime = TimeInterval(Double(progress) * player.duration)
        if isPlaying {
            player.play()
        }
    }
      
    public func getProgress() -> Float {
        guard let player = player else { return 0 }    
        return Float(player.currentTime / player.duration)
    }
    
    public func setVolume(_ volume: Float) {
        guard let player = player else { return }
        player.volume = volume
    }
    
    public func getVolume() -> Float {
        guard let player = player else { return 0 }
        return player.volume
    }
}