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

    public init(_ pattern: Pattern, _ text: String = "", speed: Double? = nil) {
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

    public func stop(_ completionType: CompletionType, text: String? = nil, terminator: String = "\n") {
        if var text = text {
            setText(text)
        }
        self.text += Array(repeating: " ", count: self.getPatternPadding(completionType.pattern))
        self.pattern = completionType.pattern
        self.running = false
        self.renderSpinner()
        print(terminator: terminator)
    }

    public func stopAndClear() {
        self.stop(CompletionType(""), text: "")
    }

    public func updateText(_ newText: String) {
        self.setText(newText)
    }

    func setText(_ newString: String) {

        let newText = Rainbow.extractModes(for: newString)
        let oldText = Rainbow.extractModes(for: self.text)

        let textLengthDifferance: Int = oldText.text.count - newText.text.count
        
        if textLengthDifferance > 0 {
            self.text = newString
            self.text += Array(repeating: " ", count: textLengthDifferance)
        } else {
            self.text = newString
        }
    }

    func getPatternPadding(_ newPattern: Pattern) -> Int {
        
        let newPatternFrameWidth: Int = Rainbow.extractModes(for: newPattern.frames[0]).text.count
        let oldPatternFrameWidth: Int = Rainbow.extractModes(for: self.pattern.frames[0]).text.count

        let patternFrameWidthDifferance: Int = oldPatternFrameWidth - newPatternFrameWidth

        if patternFrameWidthDifferance > 0 {
            return patternFrameWidthDifferance
        }else {
            return 0
        }
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
