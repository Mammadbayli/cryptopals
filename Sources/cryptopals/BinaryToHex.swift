let binaryTohexDigits = [
    "0000": "0",
    "0001": "1",
    "0010": "2",
    "0011": "3",
    "0100": "4",
    "0101": "5",
    "0110": "6",
    "0111": "7",
    "1000": "8",
    "1001": "9",
    "1010": "A",
    "1011": "B",
    "1100": "C",
    "1101": "D",
    "1110": "E",
    "1111": "F"
]

func binaryToHex(binaryString str: String) -> String {
    guard str.count%4 == 0 else { fatalError() }

    var result = ""
    var startIndex: String.Index? = str.index(str.startIndex, offsetBy: 0, limitedBy:str.endIndex)
    var endIndex: String.Index? = str.index(str.startIndex, offsetBy: 3, limitedBy:str.endIndex)

    while true {
        let substring = String(str[startIndex!...endIndex!])

        result += bitStringToHexDigit(bitString: substring)
        
        guard 
            let start = str.index(endIndex!, offsetBy: 1, limitedBy:str.endIndex),
            let end = str.index(start, offsetBy: 3, limitedBy:str.endIndex)
        else { 
            break 
        }

        startIndex = start
        endIndex = end
    }

    return result.lowercased()
}

func bitStringToHexDigit(bitString: String) -> String {
    guard bitString.count == 4 else { fatalError() }

    guard let hexDigit = binaryTohexDigits[bitString] else { fatalError() }

    return hexDigit
}