import UIKit

class Animal {
    let legCount : Int
    
    init(legCount: Int) {
        self.legCount = legCount
    }
}

class Dog: Animal {
    let barkSpeak: String
    
    init(barkSpeak: String, legCount: Int) {
        self.barkSpeak = barkSpeak
        super.init(legCount: legCount)
    }
    
    func bark() {
        print("\(self.barkSpeak)! \(self.barkSpeak)!")
    }
}

class Corgi: Dog {
    let name: String
    
    init(barkSpeak: String, legCount: Int, name: String) {
        self.name = name
        super.init(barkSpeak: barkSpeak, legCount: legCount)
    }
    
    override func bark() {
        print("\(self.barkSpeak)!")
    }
}

class Poodle: Dog {
    let name: String
    
    init(barkSpeak: String, legCount: Int, name: String) {
        self.name = name
        super.init(barkSpeak: barkSpeak, legCount: legCount)
    }
    
    override func bark() {
        print("\(self.barkSpeak)~!!")
    }
}

class Cat: Animal {
    let speakString: String
    let isTame: Bool
    
    
    init(speakString: String, legCount: Int, isTame: Bool) {
        self.isTame = isTame
        self.speakString = speakString
        super.init(legCount: legCount)
    }
    
    func speak() {
        if self.isTame {
            print("\(self.speakString)~~+")
        } else {
            print("\(self.speakString)~~-")
        }
    }
    
}

class Persian: Cat {
    let name: String
    
    init(speakString: String, legCount: Int, isTame: Bool, name: String) {
        self.name = name
        super.init(speakString: speakString, legCount: legCount, isTame: isTame)
    }
    
    override func speak() {
        if self.isTame {
            print("\(self.speakString)~~^+")
        } else {
            print("\(self.speakString)~~^-")
        }
    }
}

class Lion: Cat {
    let name: String
    
    init(speakString: String, legCount: Int, isTame: Bool, name: String) {
        self.name = name
        super.init(speakString: speakString, legCount: legCount, isTame: isTame)
    }
    
    override func speak() {
        if self.isTame {
            print("\(self.speakString)&&+")
        } else {
            print("\(self.speakString)&&-")
        }
    }
    
}

let corgi = Corgi(barkSpeak: "Cor", legCount: 4, name: "robert")
corgi.bark( )
let poodle = Poodle(barkSpeak: "Pol", legCount: 4, name: "Taylor")
poodle.bark( )
let persian = Persian(speakString: "Pers", legCount: 4, isTame: true, name: "Cup")
persian.speak()
let lion = Lion(speakString: "Li", legCount: 4, isTame: false, name: "Plate")
lion.speak()
