import UIKit

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfdefqffq", password: "adqwdwdqd" )
}

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
    
    static var entropy = Int.random(in: 1...10000)
    
    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
}
