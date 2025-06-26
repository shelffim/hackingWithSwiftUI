import UIKit

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy : () -> Void = greetUser
greetCopy()

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

sayHello("Taylor")

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    
//    return name1 < name2
//}
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeam)

func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    // code
}

let payment2 = { (user: String) in
    print("Paying \(user)...")
}

let payment3 = { (user: String) -> Bool in
    print("Paying \(user)...")
    return true
}

let payment4 = { () -> Bool in
    print("Paying an anonymous person...")
    return true
}
