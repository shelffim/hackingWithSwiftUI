/*
import Foundation

// MARK: - 데이터 모델 (Data Models)

/// 제품 카테고리를 나타내는 열거형입니다.
/// String 원시값을 가지며, 모든 케이스를 순회할 수 있도록 CaseIterable 프로토콜을 채택합니다.
enum Category: String, CaseIterable {
    case laptop = "노트북"
    case smartphone = "스마트폰"
    case tablet = "태블릿"
    case accessory = "액세서리"
}

/// 전자제품을 나타내는 구조체입니다.
struct Product {
    let id: UUID
    var name: String
    var category: Category
    var price: Double
    var stock: Int
    var description: String?

    /// 새로운 제품 인스턴스를 생성합니다.
    /// id는 자동으로 생성됩니다.
    init(name: String, category: Category, price: Double, stock: Int, description: String? = nil) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.price = price
        self.stock = stock
        self.description = description
    }
}

// MARK: - 재고 관리 (Inventory Management)

/// 재고 관리 중 발생할 수 있는 에러를 정의한 열거형입니다.
enum InventoryError: Error {
    case duplicateID
    case productNotFound
}

/// 재고를 관리하는 구조체입니다.
struct Inventory {
    /// 제품들을 저장하는 딕셔너리. [제품ID: 제품 정보]
    private var products: [UUID: Product] = [: ]

    /// 새로운 제품을 재고에 추가합니다.
    /// - Throws: 이 구현에서는 ID 충돌 가능성이 거의 없으므로 에러를 던지지 않습니다.
    /// - Returns: 추가된 제품 객체
    mutating func addProduct(name: String, category: Category, price: Double, stock: Int, description: String? = nil) throws -> Product {
        let newProduct = Product(name: name, category: category, price: price, stock: stock, description: description)
        
        // 딕셔너리에 이미 해당 ID가 있는지 확인 (UUID의 고유성 때문에 거의 발생하지 않음)
        guard products[newProduct.id] == nil else {
            throw InventoryError.duplicateID
        }
        
        products[newProduct.id] = newProduct
        return newProduct
    }

    /// ID를 이용해 재고에서 제품을 삭제합니다.
    /// - Throws: `InventoryError.productNotFound` - 해당 ID의 제품이 없을 때
    mutating func removeProduct(by id: UUID) throws {
        guard products.removeValue(forKey: id) != nil else {
            throw InventoryError.productNotFound
        }
    }

    /// ID로 제품을 검색합니다.
    /// - Returns: 찾은 경우 `Product` 객체, 그렇지 않으면 `nil`
    func findProduct(by id: UUID) -> Product? {
        return products[id]
    }

    /// 제품의 재고 수량을 업데이트합니다.
    /// - Throws: `InventoryError.productNotFound` - 해당 ID의 제품이 없을 때
    mutating func updateStock(for id: UUID, newStock: Int) throws {
        guard var productToUpdate = products[id] else {
            throw InventoryError.productNotFound
        }
        productToUpdate.stock = newStock
        products[id] = productToUpdate
    }

    /// 재고에 있는 모든 제품 목록을 출력합니다.
    func listAllProducts() {
        print("--- 전체 제품 목록 ---")
        guard !products.isEmpty else {
            print("재고에 제품이 없습니다.")
            return
        }
        for product in products.values {
            print("ID: \(product.id.uuidString.prefix(8)), 이름: \(product.name), 카테고리: \(product.category.rawValue), 가격: $\(product.price), 재고: \(product.stock)개")
        }
        print("--------------------\n")
    }

    /// 특정 카테고리에 속하는 제품 목록을 출력합니다.
    func listProducts(by category: Category) {
        print("--- \(category.rawValue) 카테고리 제품 목록 ---")
        let filteredProducts = products.values.filter { $0.category == category }
        
        guard !filteredProducts.isEmpty else {
            print("해당 카테고리에 제품이 없습니다.")
            return
        }
        
        for product in filteredProducts {
            print("ID: \(product.id.uuidString.prefix(8)), 이름: \(product.name), 가격: $\(product.price), 재고: \(product.stock)개")
        }
        print("------------------------------------\n")
    }

    /// 전체 재고의 총 가치를 계산합니다.
    /// - Returns: 모든 제품의 (가격 * 재고)의 합
    func calculateTotalValue() -> Double {
        return products.values.reduce(0) { $0 + ($1.price * Double($1.stock)) }
    }

    /// 재고가 부족한 (지정된 수량 미만인) 제품 목록을 찾습니다.
    /// - Parameter threshold: 재고 부족의 기준이 되는 수량 (기본값 5)
    /// - Returns: 재고 부족 제품의 배열
    func findLowStockProducts(threshold: Int = 5) -> [Product] {
        return products.values.filter { $0.stock < threshold }
    }
}


// MARK: - 실행 및 테스트 (Execution & Testing)

// 1. Inventory 인스턴스 생성
var inventory = Inventory()
print("재고 관리 시스템을 시작합니다.\n")

// 2. 제품 추가
do {
    let macbook = try inventory.addProduct(name: "MacBook Air 13", category: .laptop, price: 999.00, stock: 15, description: "Featherlight and powerful.")
    let iphone = try inventory.addProduct(name: "iPhone 15 Pro", category: .smartphone, price: 1099.00, stock: 20)
    let ipad = try inventory.addProduct(name: "iPad Air", category: .tablet, price: 599.00, stock: 8)
    let magicMouse = try inventory.addProduct(name: "Magic Mouse", category: .accessory, price: 79.00, stock: 30)
    let keyboard = try inventory.addProduct(name: "Magic Keyboard", category: .accessory, price: 99.00, stock: 4)

    print("초기 제품이 성공적으로 추가되었습니다.\n")
} catch {
    print("오류: 제품 추가에 실패했습니다 - \(error)")
}

// 3. 전체 제품 목록 출력
inventory.listAllProducts()

// 4. 카테고리별 제품 목록 출력
inventory.listProducts(by: .accessory)

// 5. 제품 검색
if let firstProduct = inventory.findProduct(by: inventory.products.keys.first!) {
    print("검색된 첫 번째 제품: \(firstProduct.name)\n")
}

// 6. 재고 업데이트
do {
    if let keyboardID = inventory.products.first(where: { $1.name == "Magic Keyboard" })?.key {
        try inventory.updateStock(for: keyboardID, newStock: 15)
        print("'Magic Keyboard'의 재고가 업데이트되었습니다.")
        if let updatedKeyboard = inventory.findProduct(by: keyboardID) {
            print("업데이트된 재고: \(updatedKeyboard.stock)개\n")
        }
    }
} catch {
    print("오류: 재고 업데이트 실패 - \(error)")
}

// 7. 제품 삭제
do {
    if let ipadID = inventory.products.first(where: { $1.name == "iPad Air" })?.key {
        try inventory.removeProduct(by: ipadID)
        print("'iPad Air'가 재고에서 삭제되었습니다.\n")
    }
} catch {
    print("오류: 제품 삭제 실패 - \(error)")
}
inventory.listAllProducts()

// 8. 재고 부족 상품 찾기
let lowStockItems = inventory.findLowStockProducts(threshold: 10)
print("--- 재고 부족 상품 (10개 미만) ---")
lowStockItems.forEach {
    print("이름: \($0.name), 남은 재고: \($0.stock)개")
}
print("---------------------------------\n")

// 9. 총 재고 가치 계산
let totalValue = inventory.calculateTotalValue()
print("총 재고 가치: $\(String(format: "%.2f", totalValue))")

*/