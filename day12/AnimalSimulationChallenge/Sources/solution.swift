/*

// MARK: - Solution

// 1. Animal 기본 클래스
// 모든 동물의 기초가 되는 클래스입니다.
// legs 프로퍼티를 통해 다리 수를 저장하고, 기본적인 speak 메서드를 가집니다.
class Animal {
    let legs: Int

    init(legs: Int) {
        self.legs = legs
    }

    func speak() {
        print("I am an animal with \(legs) legs.")
    }
}

// 2. Animal을 상속받는 Dog와 Cat 클래스
// Animal의 기능을 물려받아 더 구체적인 동물로 확장합니다.

class Dog: Animal {
    let isGoodBoy: Bool

    init(isGoodBoy: Bool) {
        self.isGoodBoy = isGoodBoy
        super.init(legs: 4) // Dog는 항상 다리가 4개라고 가정
    }

    // super.speak()를 호출하여 부모의 메서드를 실행하고, 자신만의 기능을 추가할 수도 있습니다.
    override func speak() {
        print("Woof! I am a dog.")
    }
}

class Cat: Animal {
    let isTired: Bool

    init(isTired: Bool) {
        self.isTired = isTired
        super.init(legs: 4) // Cat도 항상 다리가 4개라고 가정
    }

    override func speak() {
        print("Meow! I am a cat.")
    }
}

// 3. Dog를 상속받는 Corgi와 Poodle 클래스
// Dog 클래스를 더 세분화하여 특정 품종을 표현합니다.

class Corgi: Dog {
    override init(isGoodBoy: Bool) {
        super.init(isGoodBoy: isGoodBoy)
    }

    override func speak() {
        print("Yap yap! I am a Corgi and I am a good boy: \(isGoodBoy).")
    }
}

class Poodle: Dog {
    override init(isGoodBoy: Bool) {
        super.init(isGoodBoy: isGoodBoy)
    }

    override func speak() {
        print("Arf arf! I am a Poodle.")
    }
}

// 4. Cat을 상속받는 Persian과 Lion 클래스
// Cat 클래스를 더 세분화합니다.

class Persian: Cat {
    override init(isTired: Bool) {
        super.init(isTired: isTired)
    }

    override func speak() {
        print("Purrrr... I am a Persian cat. Am I tired? \(isTired).")
    }
}

class Lion: Cat {
    override init(isTired: Bool) {
        super.init(isTired: isTired)
    }

    override func speak() {
        print("Roar! I am a lion!")
    }
}

// --- 실행 예시 ---
/*

let myDog = Dog(isGoodBoy: true)
myDog.speak()

let myCorgi = Corgi(isGoodBoy: true)
myCorgi.speak()

let myLion = Lion(isTired: false)
myLion.speak()

*/

*/
