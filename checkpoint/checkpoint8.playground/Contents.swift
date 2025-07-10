import UIKit

protocol Structure {
    var roomCount: Int { get set } // 방 개수
    var coast: Int { get set } // 비용
    var realEstateName: String { get } // 부동산 이름
    func saleSummary() -> String
    mutating func extendCoast(_ amount: Int)
    mutating func extendRoom(_ room: Int)
}

extension Structure {
    func saleSummary() -> String {
        return "방 개수: \(roomCount), 비용: \(coast), 부동산 이름: \(realEstateName)"
    }
    
    mutating func extendCoast(_ amount: Int) {
        self.coast = amount
    }
    
    mutating func extendRoom(_ room: Int) {
        self.roomCount = room
    }
}

struct House: Structure {
    var roomCount: Int = 4
    var coast: Int = 500000
    var realEstateName: String = "Taylor"
    
    func saleSummary() -> String {
        return "아파트 // 방 개수: \(roomCount), 비용: \(coast), 부동산 이름: \(realEstateName)"
    }
}

struct Office: Structure {
    var roomCount: Int = 4
    var coast: Int = 500000
    var realEstateName: String = "Taylor"
    
    func saleSummary() -> String {
        return "오피스텔 // 방 개수: \(roomCount), 비용: \(coast), 부동산 이름: \(realEstateName)"
    }
}

let house = House()
print(house.saleSummary())

var office = Office()
office.extendRoom(5)
office.extendCoast(100_000_000)
print(office.saleSummary())

