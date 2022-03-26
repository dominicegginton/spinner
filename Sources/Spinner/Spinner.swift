import Foundation
import Dispatch
import Nanoseconds
import Rainbow
import Signals

struct StdOutSpinnerStream: SpinnerStream {
    func write(string: String, terminator: String) {
        print(string, terminator: terminator)
        fflush(stdout)
    }

    func hideCursor() {
        print("\u{001B}[?25l", terminator: "")
        fflush(stdout)
    }

    func showCursor() {
        print("\u{001B}[?25h", terminator: "")
        fflush(stdout)
    }
}

struct DefaultSpinnerSignal: SpinnerSignal {
    func trap() {
        Signals.trap(signal: .int) { _ in
            print("\u{001B}[?25h", terminator: "")
            exit(0)
        }
    }
}

public final class Spinner {
    var animation: SpinnerAnimation {
        didSet {
            self.frameIndex = 0
        }
    }
    var message: String
    var status: Bool
    var color: Color
    var speed: Double
    var format: String
    let stream: SpinnerStream

    var frameIndex: Int
    var queue: DispatchQueue
    var timestamp: Now?

    /**
    Initialize spinner
    - Parameter animation: spinner animation
    - Parameter message: message to render
    - Parameter color: spinner animation color
    - Parameter speed: speed of spinner animation
    - Parameter format: spinner format
    - Parameter stream: output steam for spinner
    - Parameter signal: signal trap implementation for spinner
    */
    public init(_ animation: SpinnerAnimation, _ message: String = "", color: Color = .default, speed: Double? = nil, format: String = "{S} {T}", stream: SpinnerStream? = nil, signal: SpinnerSignal? = nil) {
        self.animation = animation
        self.message = message
        self.color = color
        self.speed = speed ?? animation.defaultSpeed
        self.format = format.uppercased()
        self.stream = stream ?? StdOutSpinnerStream()

        self.frameIndex = 0
        self.status = false
        self.queue = DispatchQueue(label: "io.Swift.Spinner")
        if let signal = signal {
            signal.trap()
        }
        else {
            DefaultSpinnerSignal().trap()
        }
    }

    /**
    Start the spinner
    */
    public func start() {
        self.stream.hideCursor()
        self.status = true
        self.timestamp = Now()
        self.queue.async { [weak self] in
            guard let `self` = self else { return }
            while self.status {
                self.render()
                usleep(useconds_t(self.speed * 1_000_000))
            }
        }
    }

    /**
    Stop the spinner
    - Parameter frame: final frame to render before stopping
    - Parameter message: final message to render before stopping
    - Parameter color: final frame color
    - Parameter terminator: the string to print after all items have been printed
    */
    public func stop(frame: String? = nil, message: String? = nil, color: Color? = nil, terminator: String = "\n") {
        self.status = false
        if let message = message {
            self.message(message)
        }
        if let color = color {
            self.color(color)
        }
        var animation: SpinnerAnimation?
        if let frame = frame {
            animation = SpinnerAnimation(frame: frame)
        }
        if let animation = animation {
            self.message += Array(repeating: " ", count: self.padding(animation))
            self.animation = animation
        }
        self.render()
        self.stream.write(string: "", terminator: terminator)
        self.stream.showCursor()
    }

    /**
    Update spinner animation
    - Parameter animation: spinner animation
    */
    public func animation(_ animation: SpinnerAnimation) {
        self.format += Array(repeating: " ", count: self.padding(animation))
        self.animation = animation
    }

    /**
    Update spinner message
    - Parameter message: message to render
    */
    public func message(_ message: String) {
        self.format += Array(repeating: " ", count: self.padding(message))
        self.message = message
    }

    /**
    Update spinner animation speed
    - Parameter speed: speed of spinner animation
    */
    public func speed(_ speed: Double) {
        self.speed = speed
    }

    /**
    Update spinner animation color
    - Parameter color: spinner animation color
    */
    public func color(_ color: Color) {
        self.color = color
    }

    /**
    Update spinner format
    - Parameter format: spinner format
    */
    public func format(_ format: String) {
        self.format = format
    }

    /**
    Stop and clear the spinner
    */
    public func clear() {
        self.stop(frame: "", message: "", terminator: "\r")
    }

    /**
    Stop and render a green tick for the final animation frame
    - Parameter message: spinner message to render
    */
    public func success(_ message: String? = nil) {
        self.stop(frame: "✔", message: message, color: .green)
    }

    /**
    Stop and render a red cross for the final animation frame
    - Parameter message: spinner message to render
    */
    public func error(_ message: String? = nil) {
        self.stop(frame: "✖", message: message, color: .red)
    }

    /**
    Stop and render a yellow warning symbol for the final animation frame
    - Parameter message: spinner message to render
    */
    public func warning(_ message: String? = nil) {
        self.stop(frame: "⚠", message: message, color: .yellow)
    }

    /**
    Stop and render a blue information sign  for the final animation frame
    - Parameter message: spinner message to render
    */
    public func info(_ message: String? = nil) {
        self.stop(frame: "ℹ", message: message, color: .blue)
    }

    func padding(_ message: String) -> Int {
        let new = Rainbow.extractModes(for: message).text.count
        let old = Rainbow.extractModes(for: self.message).text.count
        let diff: Int = old - new
        if diff > 0 {
            return diff
        } else {
            return 0
        }
    }

    func padding(_ animation: SpinnerAnimation) -> Int {
        let new: Int = Rainbow.extractModes(for: animation.frames[0]).text.count
        let old: Int = Rainbow.extractModes(for: self.animation.frames[0]).text.count
        let diff: Int = old - new
        if diff > 0 {
            return diff
        } else {
            return 0
        }
    }

    func frame() -> String {
        let frame = self.animation.frames[self.frameIndex].applyingCodes(self.color)
        self.frameIndex = (self.frameIndex + 1) % self.animation.frames.count
        return frame
    }

    func render() {
        var spinner = self.format.replacingOccurrences(of: "{S}", with: self.frame()).replacingOccurrences(of: "{T}", with: self.message)
        if let timestamp = self.timestamp {
            let duration = Now() - timestamp
            spinner = spinner.replacingOccurrences(of: "{D}", with: duration.timeString)
        }
        stream.write(string: "\r", terminator: "")
        stream.write(string: spinner, terminator: "")
    }
}
