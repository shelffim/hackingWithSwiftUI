import UIKit

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creting an anonymous employee")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Roslin")

// as does creating an anonymous employee
let anon = Employee()

struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
    
//    init(name studentName: String, bestFriend studentBestFriend: String) {
//        print("Enrolling \(studentName) in class...")
//        name = studentName
//        bestFriend = studentBestFriend
//    }
}
