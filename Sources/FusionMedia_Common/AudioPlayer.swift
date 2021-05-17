import Foundation

public protocol AudioPlayerProtocol {
    init(url: URL)

    var isPlaying: Bool { get }
    var duration: Double { get }
    var currentTime: Double { get }
    var volume: Float { get set }
    
    func play()
    func stop()
    func seek(to: Double)
}

