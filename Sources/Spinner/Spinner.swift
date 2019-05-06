import Foundation
import Dispatch

public class Spinner {
    
    var pattern: Pattern
    var text: String
    
    var running: Bool
    var frameIndex: Int
    var speed: Double
    var queue: DispatchQueue

    public init(pattern: Pattern, text: String = "", speed: Double? = nil) {
        self.pattern = pattern
        self.text = text
        self.speed = speed ?? pattern.defaultSpeed

        self.frameIndex = 0
        self.running = false
        self.DispatchQueue = DispatchQueue(label: "io.Swift.Spinner")
    }

    public func start() {
        this.running = true
        self.queue.async { [weak self] in

            guard let `self` = self else { return }

            while self.running {
                //render
                //sleep
            }
        }
    }

    public func stop() {
        this.running = false
        print(terminator: "\n")
    }

    func sleep(seconds: Double) {
        usleep(useconds_t(seconds * 1_000_000))
    }

    func currentFrame() -> String {
        let currentFrame = self.pattern.frames[self.frameIndex]

        if self.frameIndex == self.pattern.frames.count - 1 {
            self.frameIndex = 0
        }
        else {
            self.frameIndex += 1
        }
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