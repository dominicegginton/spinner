import Foundation
import Dispatch
import Rainbow
import Signals

public final class Spinner {
    public var pattern: SpinnerPattern {
        didSet {
            self.frameIndex = 0
        }
    }
    public  var text: String
    public var color: Color
    public  var format: String
    public var speed: Double
    var running: Bool
    var frameIndex: Int
    var queue: DispatchQueue

    /**
    Create new spinner 

    - Parameter _: SpinnerPattern - The pattern the spinner will animate over
    - Parameter _: String - The text the spinner will display
    - Parameter speed: Double - The speed the spinner will animate at - default is defined per SpinnerPattern
    - Parameter color: Color - The color the animated pattern will render as - default is white
    - Parameter: format: String - The format of the spinner - default is "{S} {T}"
    */
    public init(_ pattern: SpinnerPattern, _ text: String = "", speed: Double? = nil, color: Color = .default, format: String = "{S} {T}") {
        self.pattern = pattern
        self.text = text
        self.speed = speed ?? pattern.defaultSpeed
        self.color = color
        self.format = format.uppercased()

        self.frameIndex = 0
        self.running = false
        self.queue = DispatchQueue(label: "io.Swift.Spinner")

        Signals.trap(signal: .int) { _ in
            print("\u{001B}[?25h", terminator: "")
            exit(0)
        }
    }

    /**
    Starts the animation for the spinner.
    */
    public func start() {
        self.hideCursor()
        self.running = true
        self.queue.async { [weak self] in

            guard let `self` = self else { return }

            while self.running {
                self.renderSpinner()
                self.sleep(seconds: self.speed)
            }
        }
    }

    /**
    Stops the animation for the spinner.

    - Parameter finalFrame: String - The persistent frame that will be displayed on the completed spinner, default is 'nil' this will keep the current frame the spinner is on
    - Parameter text: String - The persistent text that will be displayed on the completed spinner, default is 'nil' this will keep the current text the spinner has
    - Parameter color: Color - The color of the final spinner frame
    - Parameter terminator: String - The terminator used for ending writing a line to the terminal, default is '\n' this will return the curser to a new line
    */
    public func stop(finalFrame: String? = nil, text: String? = nil, color: Color? = nil, terminator: String = "\n") {
        self.running = false
        self.text = text ?? self.text
        self.color = color ?? self.color
        var finalPattern: SpinnerPattern?
        if let frame = finalFrame {
            finalPattern = SpinnerPattern(singleFrame: frame)
        }
        if let pattern = finalPattern {
            self.text += Array(repeating: " ", count: self.getPatternPadding(pattern))
            self.pattern = pattern
        }
        self.unhideCursor()
        self.renderSpinner()
        print(terminator: terminator)
    }

    /**
    Clears the spinner from the terminal and returns the curser to the start of the spinner
    */
    public func clear() {
        self.stop(finalFrame: "", text: "", terminator: "\r")
    }

    /**
    Stops the spinner and displays a green ✔ with the provided text

   - Parameter _: String The persistent text that will be displayed on the completed spinner, default will keep the current text of the spinner 
    */
    public func succeed(_ text: String? = nil) {
        self.stop(finalFrame: "✔", text: text, color: .green)
    }

    /**
    Stops the spinner and displays a red ✖ with the provided text

    - Parameter _: String The persistent text that will be displayed on the completed spinner
    */
    public func failure(_ text: String? = nil) {
        self.stop(finalFrame: "✖", text: text, color: .red)
    }

    /**
    Stops the spinner and displays a yellow ⚠ with the provided text

    - Parameter _: String The persistent text that will be displayed on the completed spinner,  default will keep the current text of the spinner 
    */
    public func warning(_ text: String? = nil) {
        self.stop(finalFrame: "⚠", text: text, color: .yellow)
    }

    /**
    Stops the spinner and displays a blue ℹ with the provided text

    - Parameter _: String The persistent text that will be displayed on the completed spinner,  default will keep the current text of the spinner 
    */
    public func information(_ text: String? = nil) {
        self.stop(finalFrame: "ℹ", text: text, color: .blue)
    }

    func getTextPadding(_ newText: String) -> Int {

        let newText = Rainbow.extractModes(for: newText)
        let oldText = Rainbow.extractModes(for: self.text)

        let textLengthDifference: Int = oldText.text.count - newText.text.count

        if textLengthDifference > 0 {
            return textLengthDifference
        } else {
            return 0
        }
    }

    func getPatternPadding(_ newPattern: SpinnerPattern) -> Int {
        
        let newPatternFrameWidth: Int = Rainbow.extractModes(for: newPattern.frames[0]).text.count
        let oldPatternFrameWidth: Int = Rainbow.extractModes(for: self.pattern.frames[0]).text.count

        let patternFrameWidthDifference: Int = oldPatternFrameWidth - newPatternFrameWidth

        if patternFrameWidthDifference > 0 {
            return patternFrameWidthDifference
        }else {
            return 0
        }
    }

    func sleep(seconds: Double) {
        usleep(useconds_t(seconds * 1_000_000))
    }

    func currentFrame() -> String {

        let currentFrame = self.pattern.frames[self.frameIndex].applyingCodes(self.color)

        self.frameIndex = (self.frameIndex + 1) % self.pattern.frames.count

        return currentFrame
    }

    func renderSpinner() {

        // Reset cursor to start of line
        print("\r", terminator: "")
        // Print the spinner frame and text
        let  renderString = self.format.replacingOccurrences(of: "{S}", with: self.currentFrame()).replacingOccurrences(of: "{T}", with: self.text)
        print(renderString, terminator: "")
        // Flush STDOUT
        fflush(stdout)

    }

    func hideCursor() {
        print("\u{001B}[?25l", terminator: "")
        fflush(stdout)
    }
    
    func unhideCursor() {
        print("\u{001B}[?25h", terminator: "")
        fflush(stdout)
    }

}
