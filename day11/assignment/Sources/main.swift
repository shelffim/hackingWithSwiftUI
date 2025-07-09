// 과제: 접근 제어를 사용하여 BankAccount 구조체를 완성하세요.
//
// 목표:
// 1. `balance` 프로퍼티는 BankAccount 내부에서만 접근 가능해야 합니다.
// 2. `deposit` 및 `withdraw` 메서드를 통해서만 `balance`를 수정할 수 있어야 합니다.
// 3. 외부에서 `account.balance = ...` 와 같이 직접 수정하려고 하면 컴파일 에러가 발생해야 합니다.
//
// 지시사항:
// - `balance` 프로퍼티에 적절한 접근 제어 키워드를 추가하여 외부로부터의 직접적인 접근을 막으세요.

struct BankAccount {
    private var balance: Double // 이 프로퍼티의 접근 수준을 수정하세요.
    
    mutating func deposit(amount: Double) {
        guard amount > 0 else {
            print("입금액은 0보다 커야 합니다.")
            return
        }
        balance += amount
        print("\(amount)원이 입금되었습니다. 현재 잔액: \(balance)원")
    }
    
    mutating func withdraw(amount: Double) {
        guard amount > 0 else {
            print("출금액은 0보다 커야 합니다.")
            return
        }
        if balance >= amount {
            balance -= amount
            print("\(amount)원이 출금되었습니다. 현재 잔액: \(balance)원")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

// 아래 코드는 수정하지 마세요.
// 올바르게 수정했다면, `account.balance = 1000000` 줄에서 컴파일 에러가 발생해야 합니다.

var account = BankAccount(balance: 1000)
account.deposit(amount: 500)
account.withdraw(amount: 200)

// 이 줄에서 컴파일 에러가 나야 합니다.
// account.balance = 1000000

// print("최종 잔액: \(account.balance)") // 이 줄도 에러가 발생해야 합니다.
