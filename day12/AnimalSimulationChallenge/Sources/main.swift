// 이 파일에 README.md의 요구사항에 맞춰 코드를 작성하세요.
// 클래스들을 정의하고, 인스턴스를 생성하여 메서드를 호출해보세요.

print("Animal Simulation Challenge Start!")

// 여기에 코드를 작성하세요.

class Animal {
    let legs: Int

    init(legs:Int) {
        self.legs = legs
    }

    func speak() {
        print("I am an animal.")
    }
}

class Dog: Animal {
    let isGoodBoy: Bool

    init(legs: Int, isGoodBoy: Bool) {
        self.isGoodBoy = isGoodBoy
        super.init(legs: legs)
    }

    override func speak() {
        print("Woof!")
    }
}

class Cat: Animal {
    let isTired: Bool

    init(legs: Int, isTired: Bool) {
        self.isTired = isTired
        super.init(legs: legs)
    }
    override func speak() {
        print("Meow!")
    }

}

class Corgi: Dog {
    override func speak() {
        print("Yap yap!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Arf arf!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Purrrr!")
    }   
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}

let corgi = Corgi(legs: 4, isGoodBoy: true)
corgi.speak()

let poodle = Poodle(legs: 4, isGoodBoy: true)
poodle.speak()

let persian = Persian(legs: 4, isTired: true)
persian.speak()

let lion = Lion(legs: 4, isTired: true)
lion.speak()