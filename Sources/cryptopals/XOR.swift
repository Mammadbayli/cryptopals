func XOR(leftSide: String, rightSide: String) -> String {
    guard leftSide.count == rightSide.count else { fatalError() }
    
    if leftSide.count == 1 {
        if leftSide == rightSide {
            return "0"
        } else {
            return "1"
        }   
    }

    var result = ""
    var leftSideTemp = leftSide
    var rightSideTemp = rightSide

    while leftSideTemp.count > 0 {
        let leftBit = String(leftSideTemp.remove(at: leftSideTemp.startIndex))
        let rightBit = String(rightSideTemp.remove(at: rightSideTemp.startIndex))

        result += XOR(leftSide: leftBit, rightSide: rightBit)
    }

    return result
}