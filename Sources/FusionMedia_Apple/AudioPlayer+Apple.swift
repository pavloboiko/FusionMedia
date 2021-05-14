import FusionMedia_Common
import AVFoundation

public class AudioPlayer {
    let url: URL
    var player: AVAudioPlayer? = nil
    var updater : CADisplayLink! = nil
    var trackProgress: ((Float) -> Void)?
    
    public required init(url: URL) {
        self.url = url
        
        player = try? AVAudioPlayer(contentsOf: self.url)
        player?.prepareToPlay()
    }
}


extension AudioPlayer: AudioPlayerProtocol {
    @objc func trackAudio() {
        guard let player = player else {
            trackProgress?(0)
            return
        }
        trackProgress?(Float(player.currentTime / player.duration))
    }
    
    public func play() {
        updater = CADisplayLink(target: self, selector: #selector(self.trackAudio))
        updater.preferredFramesPerSecond = 1
        updater.add(to: .current, forMode: .common)

        player?.play()
    }
    
    public func stop() {
       player?.stop()
    }
    
    public func isPlaying() -> Bool {
        guard let player = player else { return false }
        return player.isPlaying
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
      
    public func getProgress(_ progress: @escaping (_ progress: Float) -> Void) {
        self.trackProgress = progress
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