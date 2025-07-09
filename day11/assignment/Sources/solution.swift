// --- 정답 코드 ---

// struct BankAccount {
//     private var balance: Double // `private`으로 설정하여 외부 접근을 막습니다.
    
//     init(balance: Double) {
//         self.balance = balance
//     }
    
//     mutating func deposit(amount: Double) {
//         guard amount > 0 else {
//             print("입금액은 0보다 커야 합니다.")
//             return
//         }
//         balance += amount
//         print("\(amount)원이 입금되었습니다. 현재 잔액: \(balance)원")
//     }
    
//     mutating func withdraw(amount: Double) {
//         guard amount > 0 else {
//             print("출금액은 0보다 커야 합니다.")
//             return
//         }
//         if balance >= amount {
//             balance -= amount
//             print("\(amount)원이 출금되었습니다. 현재 잔액: \(balance)원")
//         } else {
//             print("잔액이 부족합니다.")
//         }
//     }
    
//     func getBalance() -> Double {
//         return balance
//     }
// }


// --- 해설 ---
//
// 이 과제의 핵심은 `balance` 프로퍼티를 외부에서 직접 수정하지 못하도록 보호하는 것입니다.
// 이를 위해 Swift의 접근 제어(Access Control) 개념을 사용합니다.
//
// **왜 `private`을 사용해야 하나요?**
//
// `private` 키워드는 프로퍼티나 메서드를 그것이 선언된 중괄호(`{}`) 안에서만 사용할 수 있도록 제한합니다.
//
// 1. **정보 은닉 (Encapsulation):** `balance`를 `private`으로 만들면, `BankAccount` 구조체 외부에서는 `balance`에 직접 접근할 수 없게 됩니다. 이것은 객체 지향 프로그래밍의 중요한 원칙 중 하나인 '정보 은닉'을 구현하는 것입니다. 즉, 구조체의 내부 상태(데이터)를 숨기고, 오직 공개된 메서드(`deposit`, `withdraw`)를 통해서만 상태를 변경하도록 강제하는 것입니다.
//
// 2. **데이터 무결성 유지:** 만약 `balance`가 `private`이 아니라면, 누구나 `account.balance = -10000` 과 같이 논리적으로 맞지 않는 값을 직접 할당할 수 있습니다. `deposit`과 `withdraw` 메서드에는 금액이 0보다 커야 한다는 등의 유효성 검사가 있지만, 직접 접근을 허용하면 이러한 로직을 모두 우회하게 됩니다. `private`으로 설정하면 데이터의 일관성과 무결성을 지킬 수 있습니다.
//
// **다른 접근 제어 수준:**
//
// - `fileprivate`: 같은 파일 내에서는 접근할 수 있습니다.
// - `internal`: 같은 모듈(앱 또는 프레임워크) 내에서는 어디서든 접근할 수 있습니다. (기본값)
// - `public`: 다른 모듈에서도 접근할 수 있습니다. (주로 프레임워크에서 사용)
// - `open`: `public`과 유사하지만, 다른 모듈에서 클래스를 서브클래싱하거나 메서드를 오버라이드할 수 있게 해줍니다.
//
// 이 경우에는 `BankAccount` 구조체 외부에서 `balance`를 완전히 숨기는 것이 목표이므로 `private`이 가장 적절한 선택입니다.
