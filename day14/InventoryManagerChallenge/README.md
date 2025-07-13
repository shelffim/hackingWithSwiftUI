# 전자기기 매장 재고 관리 시스템 과제

## 목표

Swift의 데이터 구조(struct, enum), 옵셔널, 에러 처리, 프로토콜 등을 활용하여 간단한 CLI(Command-Line Interface) 기반의 재고 관리 시스템을 구현합니다. 이 과제는 `day14`까지의 학습 내용을 기반으로 하며, 실무에서 마주할 수 있는 데이터 모델링 및 관리 문제를 해결하는 능력을 기르는 데 중점을 둡니다.

## 요구사항

### 1. 데이터 모델링 (Data Modeling)

-   **`Product` (제품) 구조체**
    -   `id`: 제품을 고유하게 식별하는 `UUID`. (자동 생성)
    -   `name`: 제품명 (`String`).
    -   `category`: 제품 카테고리 (`Category` 열거형).
    -   `price`: 가격 (`Double`).
    -   `stock`: 재고 수량 (`Int`).
    -   `description`: 제품에 대한 설명 (`String`, 옵셔널).

-   **`Category` (카테고리) 열거형**
    -   `String` 원시값(Raw Value)을 가지며, `CaseIterable` 프로토콜을 채택해야 합니다.
    -   케이스: `laptop`, `smartphone`, `tablet`, `accessory`

### 2. 재고 관리 (Inventory Management)

-   **`InventoryError` (재고 관리 에러) 열거형**
    -   `Error` 프로토콜을 채택해야 합니다.
    -   `duplicateID`: 제품 ID가 중복될 때 발생하는 에러.
    -   `productNotFound`: 제품을 찾을 수 없을 때 발생하는 에러.

-   **`Inventory` (재고) 구조체**
    -   `products`: `Product` 객체를 저장하는 딕셔너리. `[UUID: Product]` 형태를 사용해 ID로 제품을 빠르게 찾을 수 있도록 합니다.

    -   **메서드 (Methods)**
        -   `addProduct(name: String, category: Category, price: Double, stock: Int, description: String?) throws -> Product`
            -   새로운 제품을 생성하고 재고에 추가합니다.
            -   내부적으로 `Product` 인스턴스를 생성해야 합니다.
            -   생성된 제품 객체를 반환합니다.
            -   **참고**: 이 메서드에서는 ID 충돌이 발생할 가능성이 거의 없으므로 `duplicateID` 에러를 던질 필요는 없습니다. `UUID`는 충분히 고유합니다.

        -   `removeProduct(by id: UUID) throws`
            -   주어진 `id`를 가진 제품을 재고에서 삭제합니다.
            -   해당 `id`의 제품이 없으면 `InventoryError.productNotFound` 에러를 던져야 합니다.

        -   `findProduct(by id: UUID) -> Product?`
            -   `id`로 제품을 검색하여 `Product` 객체(옵셔널)를 반환합니다.

        -   `updateStock(for id: UUID, newStock: Int) throws`
            -   지정된 `id`의 제품 재고를 업데이트합니다.
            -   제품이 없으면 `InventoryError.productNotFound` 에러를 던져야 합니다.

        -   `listAllProducts()`
            -   재고에 있는 모든 제품의 정보를 출력합니다. (간단한 `print`문 사용)

        -   `listProducts(by category: Category)`
            -   특정 카테고리에 속하는 모든 제품의 정보를 출력합니다.

        -   `calculateTotalValue() -> Double`
            -   전체 재고의 가치(모든 제품의 `price * stock`의 합)를 계산하여 반환합니다.

        -   `findLowStockProducts(threshold: Int = 5) -> [Product]`
            -   재고가 `threshold` 미만인 제품 목록을 찾아 반환합니다.

### 3. 구현 가이드

-   `main.swift` 파일에 위 요구사항에 맞는 데이터 타입과 메서드를 구현하세요.
-   `main.swift`의 실행 부분에 예시 코드를 작성하여 각 기능이 올바르게 동작하는지 테스트하세요.
    -   여러 개의 제품 추가
    -   제품 삭제 및 검색
    -   재고 업데이트
    -   카테고리별 목록 출력
    -   총 재고 가치 출력
    -   재고 부족 상품 찾기
-   `do-catch` 구문을 사용하여 에러 처리를 적절히 구현해야 합니다.

## 실행 방법

터미널에서 `InventoryManagerChallenge` 폴더로 이동한 후 다음 명령어를 실행하세요.

```bash
swift run
```
