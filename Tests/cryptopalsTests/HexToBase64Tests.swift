import XCTest
@testable import cryptopals


class HexToBase64Tests: XCTestCase {

    func testHexToBase64() {
        //Given
        let hexString = "b9ce00a03f76de2e0bf26eb8ddc94a0d8255f6a83b00c48d84d35942f65e1bdade5fb728bf469b289d264e258885bb26fe0f"
        let expectation = "uc4AoD923i4L8m643clKDYJV9qg7AMSNhNNZQvZeG9reX7cov0abKJ0mTiWIhbsm/g8="

        //When
        let result = hextoBase64(hexString: hexString)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testHexToBinary() {
        //Given
        let hexString = "1c0111001f010100061a024b53535009181c"
        let expectation = "000111000000000100010001000000000001111100000001000000010000000000000110000110100000001001001011010100110101001101010000000010010001100000011100"

        //When
        let result = hexToBinary(hexString: hexString)

        //Then
        XCTAssertEqual(expectation, result)
    }

     func testHexToBinary2() {
        //Given
        let hexString = "686974207468652062756c6c277320657965"
        let expectation = "011010000110100101110100001000000111010001101000011001010010000001100010011101010110110001101100001001110111001100100000011001010111100101100101"

        //When
        let result = hexToBinary(hexString: hexString)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testBinaryToBase64() {
        //Given
        let binaryString = "0101010001101000011001010010000001110001011101010110100101100011011010110010000001100010011100100110111101110111011011100010000001100110011011110111100000100000011010100111010101101101011100000111001100100000011011110111011001100101011100100010000000110001001100110010000001101100011000010111101001111001001000000110010001101111011001110111001100101110"
        let expectation = "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIDEzIGxhenkgZG9ncy4="

        //When
        let result = binaryToBase64(binaryString: binaryString)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testBitStringToBase64SymbolWhenInputIsFullSixBits() {
        //Given
        let bitString = "110011"
        let expectation = base64Table[Int(bitString, radix:2)!]!

        //When
        let result = bitStringToBase64Symbol(bitString: bitString)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testBitStringToBase64SymbolWhenInputIsFourBits() {
        //Given
        let bitString = "1100"
        let expectation = base64Table[Int(bitString, radix:2)!*2*2]! + "="

        //When
        let result = bitStringToBase64Symbol(bitString: bitString)

        //Then
        XCTAssertEqual(expectation, result)
    }

    func testBitStringToBase64SymbolWhenInputIsTwoBits() {
        //Given
        let bitString = "11"
        let expectation = base64Table[Int(bitString, radix:2)!*2*2*2*2]! + "=="

        //When
        let result = bitStringToBase64Symbol(bitString: bitString)

        //Then
        XCTAssertEqual(expectation, result)
    }
}