import UIKit

let optionalArr : [Int]? = []

if let answer = optionalArr?.randomElement() {
    print(answer)
} else {
    print(Int.random(in: 1...100))
}


