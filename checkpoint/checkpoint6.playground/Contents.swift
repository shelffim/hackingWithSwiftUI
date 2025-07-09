import UIKit

enum GearState: Int {
    case gear1 = 1
    case gear2 = 2
    case gear3 = 3
    case gear4 = 4
    case gear5 = 5
    case gear6 = 6
    case gear7 = 7
    case gear8 = 8
    case gear9 = 9
    case gear10 = 10
    
}

struct Car {
    let model: String = "BMW"
    let sheetCount: Int = 4
    
    private var currentGear: GearState = .gear1
    
    mutating func changeGear(_ manipulate: String) {
        if manipulate == "up" {
            if let changeGear = GearState(rawValue : currentGear.rawValue + 1) {
                currentGear = changeGear
            }
        } else if manipulate == "down" {
            if let changeGear = GearState(rawValue: currentGear.rawValue - 1) {
                currentGear = changeGear
            }
        }
    }
}
