import UIKit

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}
if let number = number {
    print(square(number: number))
}

func findGreatestValueInList(list: [Int]) -> Int? {
    if list.count == 0 {
        return nil
    }
    
    var greatestValue =  -1
    for number in list {
        if number > greatestValue {
            greatestValue = number
        }
//        print(number)
    }
    return greatestValue
}

//findGreatestValueInList(list: [1,2,3,1,10,4,200])
findGreatestValueInList(list: [-3, -2, -1, 0, 1, 100, 2])

func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}

