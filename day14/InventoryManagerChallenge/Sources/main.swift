import Foundation

// MARK: - 데이터 모델 (Data Models)

// TODO: 1. `Category` 열거형을 정의하세요.
// - 원시값(Raw Value)으로 String을 사용하고, CaseIterable 프로토콜을 채택해야 합니다.
// - 케이스: laptop, smartphone, tablet, accessory


// TODO: 2. `Product` 구조체를 정의하세요.
// - id: UUID (자동 생성)
// - name: String
// - category: Category
// - price: Double
// - stock: Int
// - description: String? (옵셔널)


// MARK: - 재고 관리 (Inventory Management)

// TODO: 3. `InventoryError` 열거형을 정의하세요.
// - Error 프로토콜을 채택해야 합니다.
// - 케이스: duplicateID, productNotFound


// TODO: 4. `Inventory` 구조체를 정의하세요.
// - products: [UUID: Product] 딕셔너리

// TODO: 5. `Inventory` 구조체에 다음 메서드들을 구현하세요.
// - addProduct(name: String, category: Category, price: Double, stock: Int, description: String?) throws -> Product
// - removeProduct(by id: UUID) throws
// - findProduct(by id: UUID) -> Product?
// - updateStock(for id: UUID, newStock: Int) throws
// - listAllProducts()
// - listProducts(by category: Category)
// - calculateTotalValue() -> Double
// - findLowStockProducts(threshold: Int = 5) -> [Product]


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