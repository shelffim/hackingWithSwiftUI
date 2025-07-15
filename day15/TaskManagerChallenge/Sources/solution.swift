/*
import Foundation

// MARK: - 데이터 구조 설계 (Data Structure Design)

// 설계 해설:
// 작업(Task)을 표현하기 위해 구조체(struct)를 선택했습니다. 각 작업은 독립적인 값으로 다루어지는 것이 자연스럽기 때문입니다.
// - id (UUID): 각 작업을 고유하게 식별하기 위해 사용합니다. 나중에 특정 작업을 수정하거나 삭제할 때 유용합니다.
// - content (String): 작업의 내용을 저장합니다. 필수 정보입니다.
// - status (Status): 작업의 진행 상태를 나타냅니다. 명확한 상태(todo, inProgress, done)를 가지므로 열거형(enum)이 가장 적합합니다.
// - priority (Priority): 작업의 중요도를 나타냅니다. 이 또한 정해진 값(low, medium, high) 중 하나이므로 열거형을 사용합니다. CaseIterable을 채택하여 모든 우선순위를 쉽게 순회할 수 있습니다.
// - dueDate (Date?): 마감 기한입니다. 모든 작업에 마감 기한이 있는 것은 아니므로 옵셔널 타입(Date?)으로 선언합니다.
// - createdAt (Date): 작업 생성 시각을 기록합니다. 기본값으로 현재 시각이 할당되도록 하여 사용자가 직접 입력할 필요가 없게 만듭니다.

/// 작업의 진행 상태를 나타내는 열거형
enum Status: String {
    case todo = "해야 할 일"
    case inProgress = "진행 중"
    case done = "완료"
}

/// 작업의 우선순위를 나타내는 열거형
enum Priority: String, CaseIterable {
    case low = "낮음"
    case medium = "중간"
    case high = "높음"
}

/// 하나의 작업을 나타내는 구조체
struct Task {
    let id: UUID
    var content: String
    var status: Status
    var priority: Priority
    var dueDate: Date?
    let createdAt: Date

    init(content: String, priority: Priority, dueDate: Date? = nil) {
        self.id = UUID()
        self.content = content
        self.status = .todo
        self.priority = priority
        self.dueDate = dueDate
        self.createdAt = Date()
    }
}

// MARK: - 작업 관리자 구현 (Task Manager Implementation)

// 설계 해설:
// TaskManager는 작업들을 관리하는 주체입니다. 여러 Task 객체들을 저장하고 처리하는 메서드를 가집니다.
// - tasks ([Task]): 작업들을 저장하기 위해 배열(Array)을 선택했습니다. 작업의 순서가 중요할 수 있고, ID로 직접 접근하는 것보다 전체를 순회하거나 필터링하는 경우가 많을 것이라 판단했기 때문입니다.
//   만약 작업 ID로 매우 빈번하게 검색해야 한다면 딕셔너리([UUID: Task])가 더 효율적일 수 있습니다. 이 과제에서는 배열로도 충분합니다.
// - 메서드들은 `mutating` 키워드를 사용하여 구조체 내부의 `tasks` 배열을 수정할 수 있도록 합니다.

struct TaskManager {
    private var tasks: [Task] = []

    /// 새로운 작업을 추가합니다.
    mutating func addTask(content: String, priority: Priority, dueDate: Date? = nil) -> Task {
        let newTask = Task(content: content, priority: priority, dueDate: dueDate)
        tasks.append(newTask)
        return newTask
    }

    /// 특정 작업의 상태를 변경합니다.
    /// - Returns: 변경 성공 시 true, 해당 ID의 작업이 없으면 false를 반환합니다.
    mutating func updateTaskStatus(by id: UUID, newStatus: Status) -> Bool {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].status = newStatus
            return true
        }
        return false
    }

    /// 전체 작업 목록을 출력합니다.
    func listAllTasks() {
        print("--- 모든 작업 목록 ---")
        guard !tasks.isEmpty else {
            print("등록된 작업이 없습니다.")
            return
        }
        for task in tasks.sorted(by: { $0.createdAt < $1.createdAt }) {
            var output = "- [\(task.status.rawValue)] \(task.content) (우선순위: \(task.priority.rawValue))"
            if let dueDate = task.dueDate {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"
                output += " | 마감: \(formatter.string(from: dueDate))"
            }
            print(output)
        }
        print("--------------------\n")
    }

    /// 특정 우선순위를 가진 작업 목록을 반환합니다.
    func filterTasks(by priority: Priority) -> [Task] {
        return tasks.filter { $0.priority == priority }
    }

    /// 완료된(done) 모든 작업을 삭제합니다.
    mutating func removeCompletedTasks() {
        tasks.removeAll { $0.status == .done }
    }

    /// (도전 과제) 마감 기한이 임박한 작업을 찾습니다.
    /// - Returns: 마감 기한이 지금으로부터 24시간 이내인 작업 배열
    func findUrgentTasks() -> [Task] {
        let now = Date()
        let timeLimit = now.addingTimeInterval(24 * 60 * 60) // 24시간 후

        return tasks.filter {
            guard let dueDate = $0.dueDate, $0.status != .done else { return false }
            return dueDate > now && dueDate <= timeLimit
        }
    }
    
    // 테스트를 위해 task id를 가져오는 도우미 함수
    func getTasks() -> [Task] {
        return tasks
    }
}

// MARK: - 실행 및 테스트 (Execution & Testing)

print("개인 작업 관리자를 시작합니다.\n")

// 1. TaskManager 인스턴스 생성
var taskManager = TaskManager()

// 2. 여러 작업 추가
let task1 = taskManager.addTask(content: "Swift 과제 제출", priority: .high, dueDate: Date().addingTimeInterval(3600 * 2)) // 2시간 후 마감
let task2 = taskManager.addTask(content: "저녁 장보기", priority: .medium)
let task3 = taskManager.addTask(content: "운동하기", priority: .low, dueDate: Date().addingTimeInterval(3600 * 30)) // 30시간 후 마감
let task4 = taskManager.addTask(content: "책 읽기", priority: .medium)

print("4개의 초기 작업이 추가되었습니다.\n")

// 3. 전체 목록 출력
taskManager.listAllTasks()

// 4. 작업 상태 변경
print("'저녁 장보기' 작업의 상태를 '진행 중'으로 변경합니다...")
_ = taskManager.updateTaskStatus(by: task2.id, newStatus: .inProgress)
print("'책 읽기' 작업의 상태를 '완료'로 변경합니다...")
_ = taskManager.updateTaskStatus(by: task4.id, newStatus: .done)
taskManager.listAllTasks()

// 5. 우선순위로 필터링하기
print("--- 우선순위 '중간'인 작업 목록 ---")
let mediumPriorityTasks = taskManager.filterTasks(by: .medium)
mediumPriorityTasks.forEach { print("- \($0.content) (상태: \($0.status.rawValue))" )}
print("------------------------------------\n")

// 6. 완료된 작업 삭제
print("완료된 작업을 모두 삭제합니다...")
taskManager.removeCompletedTasks()
taskManager.listAllTasks()

// 7. (도전 과제) 마감 임박 작업 찾기
print("--- 24시간 내 마감 임박 작업 ---")
let urgentTasks = taskManager.findUrgentTasks()
if urgentTasks.isEmpty {
    print("마감 임박 작업이 없습니다.")
} else {
    urgentTasks.forEach { print("- \($0.content)") }
}
print("------------------------------\n")

*/