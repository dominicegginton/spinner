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
    var pattern: SpinnerPattern {
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

    public init(_ pattern: SpinnerPattern, _ message: String = "", color: Color = .default, speed: Double? = nil, format: String = "{S} {T}", stream: SpinnerStream? = nil, signal: SpinnerSignal? = nil) {
        self.pattern = pattern
        self.message = message
        self.color = color
        self.speed = speed ?? pattern.defaultSpeed
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

    public func stop(frame: String? = nil, message: String? = nil, color: Color? = nil, terminator: String = "\n") {
        self.status = false
        if let message = message {
            self.message(message)
        }
        if let color = color {
            self.color(color)
        }
        var pattern: SpinnerPattern?
        if let frame = frame {
            pattern = SpinnerPattern(frame: frame)
        }
        if let pattern = pattern {
            self.message += Array(repeating: " ", count: self.padding(pattern))
            self.pattern = pattern
        }
        self.render()
        self.stream.write(string: "", terminator: terminator)
        self.stream.showCursor()
    }

    public func clear() {
        self.stop(frame: "", message: "", terminator: "\r")
    }

    public func pattern(_ pattern: SpinnerPattern) {
        self.format += Array(repeating: " ", count: self.padding(pattern))
        self.pattern = pattern
    }

    public func message(_ message: String) {
        self.format += Array(repeating: " ", count: self.padding(message))
        self.message = message
    }

    public func speed(_ speed: Double) {
        self.speed = speed
    } 

    public func color(_ color: Color) {
        self.color = color
    }

    public func format(_ format: String) {
        self.format = format
    }

    public func success(_ message: String? = nil) {
        self.stop(frame: "✔", message: message, color: .green)
    }

    public func error(_ message: String? = nil) {
        self.stop(frame: "✖", message: message, color: .red)
    }

    public func warning(_ message: String? = nil) {
        self.stop(frame: "⚠", message: message, color: .yellow)
    }

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

    func padding(_ pattern: SpinnerPattern) -> Int {
        let new: Int = Rainbow.extractModes(for: pattern.frames[0]).text.count
        let old: Int = Rainbow.extractModes(for: self.pattern.frames[0]).text.count
        let diff: Int = old - new
        if diff > 0 {
            return diff
        } else {
            return 0
        }
    }

    func frame() -> String {
        let frame = self.pattern.frames[self.frameIndex].applyingCodes(self.color)
        self.frameIndex = (self.frameIndex + 1) % self.pattern.frames.count
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
