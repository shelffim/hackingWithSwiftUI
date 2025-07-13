import UIKit

let optionalArr : [Int]? = []

func randomInt(_ arr:[Int]?) -> Int {
    return arr?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInt(optionalArr))
