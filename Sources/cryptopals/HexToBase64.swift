let base64Table = [
    00: "A", 16:"Q", 32: "g", 48:"w",
    01: "B", 17:"R", 33: "h", 49:"x",
    02: "C", 18:"S", 34: "i", 50:"y",
    03: "D", 19:"T", 35: "j", 51:"z",
    04: "E", 20:"U", 36: "k", 52:"0",
    05: "F", 21:"V", 37: "l", 53:"1",
    06: "G", 22:"W", 38: "m", 54:"2",
    07: "H", 23:"X", 39: "n", 55:"3",
    08: "I", 24:"Y", 40: "o", 56:"4",
    09: "J", 25:"Z", 41: "p", 57:"5",
    10: "K", 26:"a", 42: "q", 58:"6",
    11: "L", 27:"b", 43: "r", 59:"7",
    12: "M", 28:"c", 44: "s", 60:"8",
    13: "N", 29:"d", 45: "t", 61:"9",
    14: "O", 30:"e", 46: "u", 62:"+",
    15: "P", 31:"f", 47: "v", 63:"/"
]

let paddingSymbol = "="

let hexToBinaryDigits = [
    "0": "0000",
    "1": "0001",
    "2": "0010",
    "3": "0011",
    "4": "0100",
    "5": "0101",
    "6": "0110",
    "7": "0111",
    "8": "1000",
    "9": "1001",
    "A": "1010",
    "B": "1011",
    "C": "1100",
    "D": "1101",
    "E": "1110",
    "F": "1111"
]

public func hexToBinary(hexString: String) -> String {
    var result = ""
    for c in hexString.uppercased() {
        let hexDigit = String(c)
        guard let binaryDigits = hexToBinaryDigits[hexDigit] else { fatalError() }
        result += binaryDigits
    }

    return result
}

func binaryToBase64(binaryString str: String) -> String {
    var result = ""
    var distance = 0

    var startIndex: String.Index? = str.index(str.startIndex, offsetBy: 0, limitedBy:str.endIndex)
    var endIndex: String.Index? = str.index(str.startIndex, offsetBy: 5, limitedBy:str.endIndex)

    while true {
        let substring = String(str[startIndex!...endIndex!])

        result += bitStringToBase64Symbol(bitString: substring)
        
        guard 
            let start = str.index(endIndex!, offsetBy: 1, limitedBy:str.endIndex),
            let end = str.index(start, offsetBy: 5, limitedBy:str.endIndex)
        else { 
            distance = str.distance(from: endIndex!, to: str.endIndex) - 1
            break 
        }

        startIndex = start
        endIndex = end
    }

    guard distance > 0 else { return result }

    endIndex = str.index(endIndex!, offsetBy: 1)
    let substring = String(str[endIndex!...])
    result += bitStringToBase64Symbol(bitString: substring)

    return result
}

func bitStringToBase64Symbol(bitString: String) -> String {
    guard 
        bitString.count <= 6,
        bitString.count%2 == 0
    else { fatalError("Incorrect number of bits for encoding should be even and less than 6") }

    var multiplier = 1
    var paddingSuffix = ""
    switch bitString.count {
        case 2:
            multiplier = 2*2*2*2
            paddingSuffix = paddingSymbol + paddingSymbol
        case 4:
            multiplier = 2*2
            paddingSuffix = paddingSymbol
        default:
            break
    }

    var result = ""
    guard
        let integerValue = Int(bitString, radix: 2),
        let base64Symbol = base64Table[integerValue*multiplier]
    else { fatalError("Not a valid value") }

    result += base64Symbol + paddingSuffix

    return result
}


func hextoBase64(hexString: String) -> String {
    return binaryToBase64(binaryString: hexToBinary(hexString: hexString))
}


