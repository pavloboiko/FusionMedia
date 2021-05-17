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
    public var isPlaying: Bool {
        guard let player = player else { return false }
        return player.isPlaying
    }
    
    public var duration: Double {
        guard let player = player else { return 0 }
        return player.duration
    }
    
    public var currentTime: Double {
        guard let player = player else { return 0 }
        return player.currentTime
    }
    
    public var volume: Float {
        get {
            guard let player = player else { return 0 }
            return player.volume
        }
        set {
            guard let player = player else { return }
            player.volume = newValue
        }
    }
    
    public func play() {
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func seek(to: Double) {
        guard let player = player else { return }
        let isPlaying = player.isPlaying
        player.stop()
        player.currentTime = TimeInterval(to)
        if isPlaying {
            player.play()
        }
    }
}