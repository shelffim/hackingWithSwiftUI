import UIKit

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    var myVar: Int? = 3

    if let unwrapped = myVar {
        print("Run if myVar has a value inside")
    }

    guard let unwrapped = myVar else {
        print("Run if myVar doesn't have a value inside")
    }
    
    print("\(number) x \(number) = \(number * number)")
}

func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
//    if let name = getMeaningOfLife() {
//        print(name)
//    }
    
    guard let name = getMeaningOfLife() else {
        return
    }
    
    print(name)
}
