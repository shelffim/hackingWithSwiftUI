import UIKit

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func checkpoint(_ arr:[Int]) -> [String] {
    let oddArr = arr.filter { $0.isMultiple(of: 2) == false }
    let sortedOddArr = oddArr.sorted()
    let mappingArr = sortedOddArr.map { String($0) + " is a lucky number"  }
    return mappingArr
}

print(checkpoint(luckyNumbers))
