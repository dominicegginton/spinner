public enum Pattern {

    case dots
    case lines

    public var frames: [String] {
        switch self {
            case .dots: return ["⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏"]
            case .lines: return ["-","\\","|","/"]
        }
    }

    public var defaultSpeed: Double {
        switch self {
            case .dots: return 0.08
            case .lines: return 0.08
        }
    }
}