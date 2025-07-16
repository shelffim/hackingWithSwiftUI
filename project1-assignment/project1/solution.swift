//
//  solution.swift
//  project1
//
//  Created by 박현준 on 7/16/25.
//

/*
import SwiftUI

// MARK: - 데이터 구조 설계 (Data Structure Design)

// 설계 해설:
// Participant: 참여자를 나타냅니다. 각 참여자는 고유해야 하므로 Identifiable 프로토콜을 채택하고 UUID로 id를 부여합니다.
// 이름(name)만으로도 구분할 수 있지만, 동명이인이 있을 경우를 대비해 UUID를 사용하는 것이 더 안정적입니다.
struct Participant: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

// 설계 해설:
// ExpenseItem: 비용 항목을 나타냅니다. 마찬가지로 Identifiable을 채택하여 목록에서 고유하게 식별할 수 있도록 합니다.
// - name: 비용의 내용 (예: "점심 식사")
// - amount: 지출 금액
// - payer: 지불한 사람의 정보를 Participant 타입으로 직접 가지고 있습니다. 이렇게 하면 payer의 이름 등을 쉽게 참조할 수 있습니다.
//   (별해: payer의 id만 가지고 있을 수도 있지만, 그러면 매번 참여자 목록에서 id로 다시 찾아야 하는 번거로움이 있습니다.)
struct ExpenseItem: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var payer: Participant
}

struct ContentView: View {
    // MARK: - 상태 프로퍼티 (State Properties)

    @State private var participants: [Participant] = []
    @State private var expenses: [ExpenseItem] = []

    // --- 입력을 위한 상태 변수 ---
    @State private var newParticipantName = ""
    @State private var newExpenseName = ""
    @State private var newExpenseAmount = ""
    @State private var selectedPayer: Participant? // Picker는 Hashable한 타입을 요구

    @FocusState private var amountFieldIsFocused: Bool

    // MARK: - 계산된 프로퍼티 (Computed Properties)

    /// 총 지출액
    var totalAmount: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    /// 1인당 부담해야 할 금액
    var amountPerPerson: Double {
        participants.isEmpty ? 0 : totalAmount / Double(participants.count)
    }

    // MARK: - 뷰 본문 (View Body)

    var body: some View {
        NavigationView {
            Form {
                // --- 참여자 관리 섹션 ---
                Section(header: Text("참여자 관리")) {
                    HStack {
                        TextField("새 참여자 이름", text: $newParticipantName)
                        Button("추가", action: addParticipant)
                            .disabled(newParticipantName.trimmingCharacters(in: .whitespaces).isEmpty)
                    }

                    ForEach(participants) { participant in
                        Text(participant.name)
                    }
                    .onDelete(perform: removeParticipant)
                }

                // --- 비용 항목 추가 섹션 ---
                // 참여자가 있어야만 비용을 추가할 수 있도록 함
                if !participants.isEmpty {
                    Section(header: Text("비용 추가")) {
                        TextField("항목 이름 (예: 저녁 식사)", text: $newExpenseName)
                        
                        TextField("금액", text: $newExpenseAmount)
                            .keyboardType(.decimalPad)
                            .focused($amountFieldIsFocused)

                        Picker("지불한 사람", selection: $selectedPayer) {
                            ForEach(participants, id: \.self) { participant in
                                Text(participant.name).tag(participant as Participant?)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        Button("항목 추가", action: addExpense)
                            .disabled(isExpenseFormInvalid)
                    }
                }

                // --- 비용 목록 섹션 ---
                if !expenses.isEmpty {
                    Section(header: Text("비용 내역")) {
                        ForEach(expenses) { expense in
                            HStack {
                                Text(expense.name)
                                Spacer()
                                Text("\(expense.amount, specifier: "%.2f")원 (\(expense.payer.name))")
                            }
                        }
                        .onDelete(perform: removeExpense)
                    }
                }

                // --- 정산 결과 섹션 ---
                if totalAmount > 0 {
                    Section(header: Text("정산 결과")) {
                        HStack {
                            Text("총 지출액")
                            Spacer()
                            Text("\(totalAmount, specifier: "%.2f")원")
                        }
                        HStack {
                            Text("1인당 부담액")
                            Spacer()
                            Text("\(amountPerPerson, specifier: "%.2f")원")
                        }
                        
                        // 각자 내야 할/받아야 할 돈 계산
                        ForEach(participants) { participant in
                            let balance = calculateBalance(for: participant)
                            HStack {
                                Text("\(participant.name) 정산 금액")
                                Spacer()
                                Text("\(balance, specifier: "%.2f")원")
                                    .foregroundColor(balance < 0 ? .red : .green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("공유 비용 계산기")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountFieldIsFocused = false
                    }
                }
            }
            .onAppear(perform: setupDefaultPayer)
            .onChange(of: participants) { _ in setupDefaultPayer() }
        }
    }
    
    // MARK: - 유효성 검사 (Validation)
    
    var isExpenseFormInvalid: Bool {
        let amount = Double(newExpenseAmount) ?? 0
        return newExpenseName.trimmingCharacters(in: .whitespaces).isEmpty || amount <= 0 || selectedPayer == nil
    }

    // MARK: - 메서드 (Methods)

    func addParticipant() {
        let trimmedName = newParticipantName.trimmingCharacters(in: .whitespaces)
        if !trimmedName.isEmpty {
            let newParticipant = Participant(name: trimmedName)
            participants.append(newParticipant)
            newParticipantName = ""
        }
    }

    func removeParticipant(at offsets: IndexSet) {
        let idsToRemove = offsets.map { participants[$0].id }
        participants.remove(atOffsets: offsets)
        // 참여자가 삭제되면, 그 사람이 지불한 비용 내역도 함께 삭제
        expenses.removeAll { idsToRemove.contains($0.payer.id) }
    }

    func addExpense() {
        guard let amount = Double(newExpenseAmount), let payer = selectedPayer else { return }
        let trimmedName = newExpenseName.trimmingCharacters(in: .whitespaces)
        
        if !trimmedName.isEmpty && amount > 0 {
            let newExpense = ExpenseItem(name: trimmedName, amount: amount, payer: payer)
            expenses.append(newExpense)
            
            // 입력 필드 초기화
            newExpenseName = ""
            newExpenseAmount = ""
        }
    }

    func removeExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
    
    /// 각 참여자의 정산 금액을 계산합니다.
    /// (자신이 낸 돈 - 1인당 부담액)
    /// - Returns: 양수면 받을 돈, 음수면 내야 할 돈
    func calculateBalance(for participant: Participant) -> Double {
        let totalPaidByParticipant = expenses.filter { $0.payer.id == participant.id }.reduce(0) { $0 + $1.amount }
        return totalPaidByParticipant - amountPerPerson
    }
    
    /// Picker의 기본 선택값을 설정합니다.
    func setupDefaultPayer() {
        if selectedPayer == nil || !participants.contains(where: { $0.id == selectedPayer?.id }) {
            selectedPayer = participants.first
        }
    }
}


// MARK: - 프리뷰 (Preview)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
