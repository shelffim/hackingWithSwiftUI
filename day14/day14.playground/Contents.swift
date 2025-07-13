import UIKit

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let new1 = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "babylon 5", "Red Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Unknown"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
//let crusherScore = scores["Crusher"] ?? 0
let crusherScore = scores["Crusher", default: 0]
