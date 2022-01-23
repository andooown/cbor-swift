import XCTest

@testable import CBOR

final class CBORTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CBOR().text, "Hello, World!")
    }
}
