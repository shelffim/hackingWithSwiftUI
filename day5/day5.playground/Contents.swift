import UIKit

let age = 18
let conVote = age >= 18 ? "Yes" : "No"

let hour = 23

if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}

print(hour < 12 ? "It's before noon" : "It's after noon")

let names=["Jayne","Kaylee","Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")

if isAuthenticated {
    print("Welcome")
}  else {
    print("Who are you?")
}
