func XORHex(leftSide: String, rightSide: String) -> String {
    let leftsideBinary = hexToBinary(hexString: leftSide)
    let rightSideBinary = hexToBinary(hexString: rightSide)
    let binaryXOR = XOR(leftSide: leftsideBinary, rightSide: rightSideBinary)

    return binaryToHex(binaryString: binaryXOR)
}