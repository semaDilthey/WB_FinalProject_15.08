import XCTest
@testable import BookAPI

final class BookAPITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BookAPI().text, "Hello, World!")
    }
}
