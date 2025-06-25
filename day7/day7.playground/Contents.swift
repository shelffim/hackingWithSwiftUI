import UIKit

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(s1: String, s2: String) -> Bool {
    return s1.sorted()==s2.sorted()
}

func areLettersIdentical2(s1: String, s2: String) -> Bool {
    s1.sorted()==s2.sorted()
}

print(areLettersIdentical(s1: "abc", s2: "cab"))
print(areLettersIdentical2(s1: "abc", s2: "cab"))

func rollDice2() -> Int {
    Int.random(in: 1...6)
}

func pythhgoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythhgoras(a: 3, b: 4)
print(c)

func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

func greet(name: String) -> String {
    if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
}

//not valid
//func greet(name: String) -> String {
//    if name == "Taylor Swift" {
//        "Oh wow!"
//    } else {
//        let greeting="Hello, \(name)"
//        return greeting
//    }
//}

func greet2(name: String) -> String {
    let response = if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
    
    return response
}

func greet3(name: String) -> String {
    let response = name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
    return response
}

print(greet(name: "Taylor Swift"))
print(greet3(name: "Taylor Swift"))
