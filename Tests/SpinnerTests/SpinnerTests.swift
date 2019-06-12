import XCTest
@testable import Spinner

final class SpinnerTests: XCTestCase {
    
    func testSpinnerState() {
        var testSpinner = Spinner(.dots, "testSpinner")
        XCTAssertEqual(false, testSpinner.running)
        testSpinner.start()
        XCTAssertEqual(true, testSpinner.running)
        testSpinner.clear()
        XCTAssertEqual(false, testSpinner.running)
    }

    func testSpinnerText() {
        var testSpinner = Spinner(.dots, "testSpinner")
        XCTAssertEqual("testSpinner", testSpinner.text)
        testSpinner.start()
        testSpinner.updateText("Spinner")
        XCTAssertEqual("Spinner    ", testSpinner.text)
        testSpinner.clear()
    }

    static var allTests = [
        ("testSpinnerState", testSpinnerState),
        ("testSpinnerText", testSpinnerText)
    ]
}
