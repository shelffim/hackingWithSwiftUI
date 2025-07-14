import Foundation

// MARK: - 데이터 모델 (Data Models)

// TODO: 1. `Category` 열거형을 정의하세요.
// - 원시값(Raw Value)으로 String을 사용하고, CaseIterable 프로토콜을 채택해야 합니다.
// - 케이스: laptop, smartphone, tablet, accessory

enum Category: CaseIterable {
    case laptop, smartphone, tablet, accessory
}


// TODO: 2. `Product` 구조체를 정의하세요.
// - id: UUID (자동 생성)
// - name: String
// - category: Category
// - price: Double
// - stock: Int
// - description: String? (옵셔널)

struct Product {
    let id: UUID = UUID()
    let name: String
    let category: Category
    var price: Double
    var stock: Int
    var description: String?
}


// MARK: - 재고 관리 (Inventory Management)

// TODO: 3. `InventoryError` 열거형을 정의하세요.
// - Error 프로토콜을 채택해야 합니다.
// - 케이스: duplicateID, productNotFound
enum InventoryError: Error {
    case duplicateID
    case productNotFound
}


// TODO: 4. `Inventory` 구조체를 정의하세요.
// - products: [UUID: Product] 딕셔너리
struct Inventory {
    var products: [UUID: Product] = [:]

    // TODO: 5. `Inventory` 구조체에 다음 메서드들을 구현하세요.
// - addProduct(name: String, category: Category, price: Double, stock: Int, description: String?) throws -> Product
// - removeProduct(by id: UUID) throws
// - findProduct(by id: UUID) -> Product?
// - updateStock(for id: UUID, newStock: Int) throws
// - listAllProducts()
// - listProducts(by category: Category)
// - calculateTotalValue() -> Double
// - findLowStockProducts(threshold: Int = 5) -> [Product]

    func addProduct(name: String, category: Category, price: Double, stock: Int, description: String?) throws -> Product {
        let product = Product(name: name, category: category, price: price, stock: stock, description: description)
        if let _ = products[product.id] {
            throw InventoryError.duplicateID
        }
        return product
    }

    mutating func removeProduct(by id: UUID) throws {
        if let _ = products[id] {
            self.products.removeValue(forKey: id)
        } else {
            throw InventoryError.productNotFound
        }
    }

    func findProduct(by id: UUID) -> Product? {
        return products[id]
    }

    mutating func updateStock(for id: UUID, newStock: Int) throws {
        if var product = self.products[id] {
            product.stock = newStock
        } else {
            throw InventoryError.productNotFound
        }
    }

    func listAllProducts() {
        for product in products.values {
            print("제품 이름: \(product.name), 카테고리: \(product.category), 가격: \(product.price), 재고: \(product.stock), 설명: \(product.description ?? "없음")")
        }
    }

    func listProducts(by category: Category) {
        for product in products.values {
            if category == product.category {
                print("제품 이름: \(product.name), 카테고리: \(product.category), 가격: \(product.price), 재고: \(product.stock), 설명: \(product.description ?? "없음")")
            }
        }
    }

    func calculateTotalValue() -> Double {
        var totalValue = 0.0
        for product in products.values {
            totalValue += product.price * Double(product.stock)
        }
        return totalValue
    }

    func findLowStockProducts(threshold: Int) -> [Product] {
        var lowStockProducts: [Product] = []
        for product in products.values {
            if product.stock < threshold {
                lowStockProducts.append(product)
            }
        }
        // if lowStockProducts.isEmpty {
        //     return nil
        // }
        return lowStockProducts
    }
}

var inventory = Inventory()

do {
    let laptop = try inventory.addProduct(name: "MacBook Pro 16", category: .laptop, price: 2399.99, stock: 10, description: "The most powerful MacBook ever.")
    inventory.products[laptop.id] = laptop
    print("추가된 제품: \(laptop.name)")

    let smartphone = try inventory.addProduct(name: "iPhone 15", category: .smartphone, price: 1099.99, stock: 20, description: "The latest iPhone with advanced features.")
    inventory.products[smartphone.id] = smartphone
    print("추가된 제품: \(smartphone.name)")

    let laptopID = laptop.id
    let smartphoneID = smartphone.id

    try inventory.removeProduct(by: laptopID)
    print("제품 삭제 완료")

    if let isSmartphone = inventory.findProduct(by: smartphoneID) {
        print("찾은 제품: \(isSmartphone)")
    } else {
        print("제품을 찾을 수 없습니다.")
    }

    if let isLaptop = inventory.findProduct(by: laptopID) {
        print("찾은 제품: \(isLaptop)")
    } else {
        print("제품을 찾을 수 없습니다.")
    }

    try inventory.updateStock(for: smartphoneID, newStock: 15)
    print("재고 업데이트 완료")

    print("전체 제품 목록:")
    inventory.listAllProducts()
    print("--------------------------------")

    print("스마트폰 제품 목록:")
    inventory.listProducts(by: .smartphone)
    print("--------------------------------")
    print("노트북 제품 목록:")
    inventory.listProducts(by: .laptop)
    print("--------------------------------")

    let totalValue = inventory.calculateTotalValue()
    print("전체 재고 가치: \(totalValue)")

    let lowStockProducts = inventory.findLowStockProducts(threshold: 5)
    print("재고가 5개 미만인 제품: \(lowStockProducts)")

    // if let lowStockProducts = inventory.findLowStockProducts(threshold: 5) {
    //     print("재고가 5개 미만인 제품: \(lowStockProducts)")
    // } else {
    //     print("재고가 5개 미만인 제품이 없습니다.")
    // }

} catch InventoryError.duplicateID {
    print("이미 존재하는 제품입니다.")
} catch InventoryError.productNotFound {
    print("제품을 찾을 수 없습니다.")
}




// MARK: - 실행 및 테스트 (Execution & Testing)

// 이 아래 부분에 테스트 코드를 작성하여 구현한 기능들을 검증하세요.

// 예시: Inventory 인스턴스 생성
// var myInventory = Inventory()

// 예시: 제품 추가
// do {
//     let laptop = try myInventory.addProduct(name: "MacBook Pro 16", category: .laptop, price: 2399.99, stock: 10, description: "The most powerful MacBook ever.")
//     print("추가된 제품: \(laptop.name)")
// } catch {
//     print("제품 추가 실패: \(error)")
// }