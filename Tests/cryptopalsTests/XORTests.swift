import XCTest
@testable import cryptopals


class XORTests: XCTestCase {
    func testXORWithOneAndZero() {
        //Given
        let leftSide = "1"
        let rightSide = "0"
        let expectation = "1"

        //When
        let result = XOR(leftSide: leftSide, rightSide: rightSide)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testXORWithZeroAndZero() {
        //Given
        let leftSide = "0"
        let rightSide = "0"
        let expectation = "0"

        //When
        let result = XOR(leftSide: leftSide, rightSide: rightSide)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testXORCommutativity() {
        //Given
        let leftSide = "0"
        let rightSide = "0"
        let expectation = XOR(leftSide: leftSide, rightSide: rightSide)

        //When
        let result = XOR(leftSide: rightSide, rightSide: leftSide)

        //Then
        XCTAssertEqual(expectation, result)
    }


    func testXORWithOneZeroAndOneOne() {
        //Given
        let leftSide = "10"
        let rightSide = "11"
        let expectation = "01"

        //When
        let result = XOR(leftSide: leftSide, rightSide: rightSide)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testXORWithLArgeRandomInputs() {
        //Given
        let leftSide =    "000111000000000100010001000000000001111100000001000000010000000000000110000110100000001001001011010100110101001101010000000010010001100000011100"
        let rightSide =   "011010000110100101110100001000000111010001101000011001010010000001100010011101010110110001101100001001110111001100100000011001010111100101100101"
        let expectation = "011101000110100001100101001000000110101101101001011001000010000001100100011011110110111000100111011101000010000001110000011011000110000101111001"

        //When
        let result = XOR(leftSide: leftSide, rightSide: rightSide)

        //Then
        XCTAssertEqual(expectation, result)
    }
}