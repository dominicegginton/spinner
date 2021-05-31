
public protocol SpinnerUI {
    func display(string: String)
    func hideCursor()
    func unhideCursor()
    func print(_ str: String, terminator: String)
}
