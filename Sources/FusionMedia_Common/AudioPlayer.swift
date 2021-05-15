import Foundation

public protocol AudioPlayerProtocol {
    init(url: URL)
    func play()
    func stop()
    func isPlaying() -> Bool
    func getDuration() -> Double
    func setProgress(_ progress: Float)
    func getProgress(_ progress: @escaping (_ progress: Float) -> Void)
    func setVolume(_ volume: Float)
    func getVolume() -> Float
}

