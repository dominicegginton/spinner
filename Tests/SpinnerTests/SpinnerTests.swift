import XCTest
@testable import Spinner

final class SpinnerTests: XCTestCase {
    
    func testSpinnerState() {
        var testSpinner = Spinner(.dots, "testSpinner")
        XCTAssertEqual(false, testSpinner.running)
        testSpinner.start()
        XCTAssertEqual(true, testSpinner.running)
        testSpinner.stopAndClear()
        XCTAssertEqual(false, testSpinner.running)
    }

    func testSpinnerText() {
        var testSpinner = Spinner(.dots, "testSpinner")
        XCTAssertEqual("testSpinner", testSpinner.text)
        testSpinner.start()
        testSpinner.updateText("Spinner")
        XCTAssertEqual("Spinner    ", testSpinner.text)
        testSpinner.stopAndClear()
    }

    func testFrames() {
        let testPattern = Pattern(multiFrame: ["a","b","c","d"])
        let testSpinner = Spinner(testPattern, "testSpinner")
        
        XCTAssertEqual(testSpinner.currentFrame(), "a")
        XCTAssertEqual(testSpinner.currentFrame(), "b")
        XCTAssertEqual(testSpinner.currentFrame(), "c")
        XCTAssertEqual(testSpinner.currentFrame(), "d")
    }

    static var allTests = [
        ("testSpinnerState", testSpinnerState),
        ("testSpinnerText", testSpinnerText),
    ]
}
