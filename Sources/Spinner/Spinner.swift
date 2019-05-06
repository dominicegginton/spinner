import Foundation
import Dispatch

public class Spinner {
    
    var pattern: Pattern
    var text: String
    
    var running: Bool
    var frameIndex: Int
    var speed: Double
    var queue: DispatchQueue = DispatchQueue(label: "io.Swift.Spinner")

    public init() {}

    public start() {}

    public stop() {}
}