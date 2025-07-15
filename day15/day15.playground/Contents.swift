import UIKit

var name = "Ted"
name = "Rebecca"

let user = "Daphne"

print(user)

let actor = "Tom Cruise 🚢"

let quote = "He tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Appe engineer
"""

print(actor.count)

print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)

let scoreDouble = 3.0

let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()

let nameString = "Taylor"
let ageString = 26
let messageString = "I'm \(nameString) and I'm \(ageString) years old."
print(messageString)

var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
let readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")
colors.remove(at: 0)
print(colors.count)

print(colors.contains("Octarine"))

let employee = [
    "name": "Taylor",
    "job": "Singer"
]

print(employee["name", default: "Unkonwn"])
print(employee["job", default: "Unkonwn"])

var numberSet = Set([1, 1, 3, 5, 7])
print(numberSet)
numberSet.insert(10)
numberSet.contains(7)

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday

var scoreTin: Double = 0
let playerTin: String = "Roy"
var luckyNumberTin: Int = 13
let piTin: Double = 3.141
var isEnabledTin: Bool = true
var albumsTin: Array<String> = ["Red","Fearless"]
let userTin: Dictionary<String, String> = ["id":"@twostraws"]
var booksTin: Set<String> = Set(["The Bluest Eye", "Foundation"])

//var albumsTin: [String] = ["Red", "Fearless"]
//var userTin: [String: String] = ["id": "@twostraws"]

var teams: [String] = [String]()
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light

let ageIf = 16

if ageIf < 12 {
    print("You can't vote")
} else if ageIf < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

let tempIf = 26

if tempIf > 20 && tempIf < 30 {
    print("It's a nice day.")
}

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella")
default:
    print("Should be okay.")
}

let ageIf3 = 18
let canVote = ageIf3 >= 18 ? "Yes" : "No"

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1..<13 {
    print("5 x \(i) is \(5 * i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

var count = 10

while count > 0 {
    print("\(count)...")
    count -= 1
}

print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(file)")
}

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let userTuple = getUser()
print("Name: \(userTuple.firstName) \(userTuple.lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let resultLable = isUppercase(string)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

let stringThrow = "12345"

do {
    let result = try checkPassword(stringThrow)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHello2 = { (name: String) -> String in
        "Hi \(name)!"
}

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter {
    $0.hasPrefix("T")
}

print(onlyT)

struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}

class EmployeeClass {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: EmployeeClass {
    func work() {
        print("I'm coding for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I spend \(hours) hours a day sarching Stack Overflow.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

class Singer {
    var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): Im dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

class UserC {
    var name = "Paul"
}

let userC = UserC()
userC.name = "Taylor"
print(userC.name)

protocol VehicleProtocol {
    var name: String {get}
    var currentPasswngers: Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct CarProtocol: VehicleProtocol {
    let name = "Car"
    var currentPasswngers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: VehicleProtocol) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = CarProtocol()
commute(distance: 100, using: car)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

var quoteT = "   The truth is rarely pure and never simple   "
let trimmed = quoteT.trimmed()
quoteT.trim()

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(lyric.lines.count)

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let numberNil = Int(input) ?? 0

print(numberNil)

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
