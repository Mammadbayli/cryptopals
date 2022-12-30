import XCTest
@testable import cryptopals


class BinaryToHexTests: XCTestCase {
    func testBinartyToHex() {
        //Given
        let binaryString = "1101"
        let expectation = "d"

        //When
        let result = binaryToHex(binaryString: binaryString)

        //Then
        XCTAssertEqual(expectation, result)
    }
}