import Foundation
import Dispatch
import Rainbow

public class Spinner {

    /// Pattern holding frames to be animated    
    var pattern: Pattern {
        didSet {
            self.frameIndex = 0
        }
    }
    /// Text that is  displayed next to spinner
    var text: String
    /// Boolean repersenting fs the spinner is currently animating
    var running: Bool
    /// Int repersenitng the current frame
    var frameIndex: Int
    /// Double repsenting the wait time for frame animation
    var speed: Double
    /// Dispatch queue that the spinner will run within
    var queue: DispatchQueue

    public init(pattern: Pattern, text: String = "", speed: Double? = nil) {
        self.pattern = pattern
        self.text = text
        self.speed = speed ?? pattern.defaultSpeed

        self.frameIndex = 0
        self.running = false
        self.queue = DispatchQueue(label: "io.Swift.Spinner")
    }

    public func start() {
        self.running = true
        self.queue.async { [weak self] in

            guard let `self` = self else { return }

            while self.running {
                self.renderSpinner()
                self.sleep(seconds: self.speed)
            }
        }
    }

    public func stop(completionHandler: CompletionHandler, text: String? = nil, terminator: String = "\n") {
        self.pattern = completionHandler.pattern
        if let text = text {
            self.text = text
        }
        self.running = false
        self.renderSpinner()
        print(terminator: terminator)
    }

    func sleep(seconds: Double) {
        usleep(useconds_t(seconds * 1_000_000))
    }

    func currentFrame() -> String {

        let currentFrame = self.pattern.frames[self.frameIndex]

        self.frameIndex = (self.frameIndex + 1) % self.pattern.frames.count

        return currentFrame
    }

    func renderSpinner() {

        // Reset cursor to start of line
        print("\r", terminator: "")
        // Print the spinner frame and text
        print("\(self.currentFrame()) \(self.text)", terminator: "")
        // Flush STDOUT
        fflush(stdout)

    }
}

public enum CompletionHandler {
    
    case success
    case failure
    case warning
    case information
    case custom(Pattern)

    public init(pattern: Pattern) {
        self = .custom(pattern)
    }

    public var pattern: Pattern {
        switch self {
            case .success: return Pattern(singleFrame: "✔".green)
            case .failure: return Pattern(singleFrame: "✖".red)
            case .warning: return Pattern(singleFrame: "⚠".yellow)
            case .information: return Pattern(singleFrame: "ℹ".blue)
            case .custom(let pattern): return pattern
        }
    }
}