import XCTest
@testable import cryptopals


class XORHexTests: XCTestCase {
    func testXORHex() {
        //Given
        let leftSide =    "1c0111001f010100061a024b53535009181c"
        let rightSide =   "686974207468652062756c6c277320657965"
        let expectation = "746865206b696420646f6e277420706c6179"

        //When
        let result = XORHex(leftSide: leftSide, rightSide: rightSide)

        //Then
        XCTAssertEqual(expectation, result)
    }
}