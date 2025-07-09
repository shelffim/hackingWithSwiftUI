import UIKit

class Animal {
    let legs: Int
    init (legs: Int) { self.legs = max(legs,0) }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    public func speak() {
        print("bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    init(isTame isTameFromInit: Bool) {
        isTame = isTameFromInit
        super.init(legs: 4)
    }
    public func speak() {
        print("meow?")
    }
}

class Corgi : Dog {
    override func speak() {
        print("Yap Yap Yap!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof!")
    }
}

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    override func speak() {
        print("Yowwwwwwww Yowwwwwwww")
    }
}
class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    override func speak() {
        print("Roooooooooor")
    }
}

let larry = Corgi()    // create an instance of the Corgi class
let moe   = Poodle()
let curly = Persian()
let shemp = Lion()

print ("Larry is a dog with \(larry.legs) legs. Larry says ")
larry.speak() ; print("\n")
print ("Moe is a dog with \(moe.legs) legs. Moe says ")
moe.speak() ; print("\n")
print ("Curly is a " + (curly.isTame ? "tame " : "wild ") + "cat with \(curly.legs) legs. Curly says ")
curly.speak() ; print ("\n")
print ("Shemp is a " + (shemp.isTame ? "tame " : "wild ") + "cat with \(shemp.legs) legs. Shemp says")
shemp.speak() ; print("\n")
