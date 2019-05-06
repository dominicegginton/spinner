import XCTest
@testable import Spinner

final class SpinnerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Spinner().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
