import UIKit

struct Car {
    let model: String
    let seatCount: Int
    
    private(set) var currentGear = 1
    
    enum GearDirection {
        case up, down, neutral
    }
    
    mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 1 { currentGear = 1 }
        case .up : currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .neutral :
            currentGear = 1
        }
        print("The \(model) is in gear \(currentGear)")
    }
}

var car = Car(model: "BMW", seatCount: 4)
car.changeGear(.up)
car.changeGear(.up)
car.changeGear(.neutral)
car.changeGear(.up)
car.changeGear(.up)
car.changeGear(.up)
car.changeGear(.down)
