import UIKit

let platforms = ["iOS",",macOS","tvOS","watchOS"]

for name in platforms {
    print("Swift works great on \(name).")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

let names = ["Sterling", "Cyril", "Khalil","Lana","Ray"]

for name in names {
    print("\(name) is a secret agent")
}

for _ in names {
    print("[CENSORED] is a secret agent!")
}

print(names[0])

print(names[1...3])

print(names[1...])
