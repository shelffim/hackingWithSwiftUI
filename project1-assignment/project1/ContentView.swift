//
//  ContentView.swift
//  project1
//
//  Created by 박현준 on 7/16/25.
//

import SwiftUI

// MARK: - 데이터 구조 설계 (Data Structure Design)

// TODO: 1. 참여자를 나타내는 구조체를 정의하세요.
// - 이름(name) 프로퍼티가 필요합니다.
// - ForEach에서 사용하려면 Identifiable 프로토콜을 채택하는 것이 좋습니다.


// TODO: 2. 비용 항목을 나타내는 구조체를 정의하세요.
// - 항목 이름(name), 금액(amount), 지불한 사람의 ID(payerID) 등의 프로퍼티가 필요합니다.
// - Identifiable 프로토콜을 채택하는 것이 좋습니다.

struct ContentView: View {
    // MARK: - 상태 프로퍼티 (State Properties)

        // TODO: 3. 참여자 목록을 저장할 @State 프로퍼티를 선언하세요.
        // 예: @State private var participants: [Participant] = []

        // TODO: 4. 비용 항목 목록을 저장할 @State 프로퍼티를 선언하세요.
        // 예: @State private var expenses: [ExpenseItem] = []

        // TODO: 5. UI 입력을 위한 @State 프로퍼티들을 선언하세요.
        // - 새로운 참여자 이름을 위한 변수
        // - 새로운 비용 항목의 이름, 금액, 지불자를 위한 변수

        // TODO: 6. (선택) TextField 포커스 관리를 위한 @FocusState 프로퍼티를 선언하세요.


        // MARK: - 계산된 프로퍼티 (Computed Properties)

        // TODO: 7. 총 지출액을 계산하는 프로퍼티를 만드세요.

        // TODO: 8. 1인당 부담액을 계산하는 프로퍼티를 만드세요.


        // MARK: - 뷰 본문 (View Body)

        var body: some View {
            NavigationView {
                Form {
                    // --- 참여자 관리 섹션 ---
                    Section(header: Text("참여자")) {
                        // TODO: 9. 새로운 참여자를 입력받는 TextField와 추가하는 Button을 구현하세요.

                        // TODO: 10. ForEach를 사용해 참여자 목록을 표시하고, .onDelete로 삭제 기능을 구현하세요.
                    }

                    // --- 비용 항목 추가 섹션 ---
                    Section(header: Text("비용 추가")) {
                        // TODO: 11. 비용 항목 이름과 금액을 입력받는 TextField를 구현하세요.
                        
                        // TODO: 12. 참여자 목록에서 지불자를 선택하는 Picker를 구현하세요.

                        // TODO: 13. 비용 항목을 추가하는 Button을 구현하세요.
                    }

                    // --- 비용 목록 섹션 ---
                    Section(header: Text("비용 내역")) {
                        // TODO: 14. ForEach를 사용해 비용 항목 목록을 표시하고, .onDelete로 삭제 기능을 구현하세요.
                    }

                    // --- 정산 결과 섹션 ---
                    Section(header: Text("정산 결과")) {
                        // TODO: 15. 총 지출액과 1인당 부담액을 표시하세요.

                        // TODO: 16. ForEach를 사용해 각 참여자의 정산 금액(더 낼 돈/받을 돈)을 계산하고 표시하세요.
                    }
                }
                .navigationTitle("공유 비용 계산기")
            }
        }

        // MARK: - 메서드 (Methods)

        // TODO: 17. 여기에 필요한 헬퍼 메서드들을 추가할 수 있습니다.
        // (예: 참여자 추가, 비용 항목 추가, 정산 금액 계산 등)
}

#Preview {
    ContentView()
}
