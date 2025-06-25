import UIKit

func isUpeercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

var user=getUser()
print("Name: \(user[0]) \(user[1])")

func getUser2() -> [String: String] {
    ["fisrtName":"Taylor", "lastName": "Swift"]
}

let user2 = getUser2()
print("Name: \(user2["fisrtName",default:"Anonymous"]) \(user2["lastName",default:"Anonymous"])")

func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3=getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}

let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")

let user6=getUser3()
let firstName=user6.firstName
let lastName=user6.lastName

print("Name: \(firstName) \(lastName)")

let (firstName1,lastName1) = getUser3()
print("Name: \(firstName1) \(lastName1)")

let (firstName2, _) = getUser3()
print("Name: \(firstName)")

