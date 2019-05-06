public enum Pattern {

    case dots
    case lines
    case singleFrame(String)
    case multiFrame([String])

    public init(singleFrame: String) {
        self = .singleFrame(singleFrame)
    }

    public init(multiFrame: [String]) {
        self = .multiFrame(multiFrame)
    } 

    public var frames: [String] {
        switch self {
            case .dots: return ["⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏"]
            case .lines: return ["-","\\","|","/"]
            case .singleFrame(let singleFrame): return [singleFrame]
            case .multiFrame(let multiFrame): return multiFrame
        }
    }

    public var defaultSpeed: Double {
        switch self {
            case .dots: return 0.08
            case .lines: return 0.08
            case .singleFrame(_): return 1
            case .multiFrame(_): return 0.08
        }
    }
}