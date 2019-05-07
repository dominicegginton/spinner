public enum CompletionType {
    
    case success
    case failure
    case warning
    case information
    case custom(String)

    public init(_ customFrame: String) {
        self = .custom(customFrame)
    }

    public var pattern: Pattern {
        switch self {
            case .success: return Pattern(singleFrame: "✔".green)
            case .failure: return Pattern(singleFrame: "✖".red)
            case .warning: return Pattern(singleFrame: "⚠".yellow)
            case .information: return Pattern(singleFrame: "ℹ".blue)
            case .custom(let customFrame): return Pattern(singleFrame: customFrame)
        }
    }
}
