import Foundation

// --- 데이터 구조 설계 공간 ---
// 여기에 작업(Task)과 관련된 데이터 타입을 직접 설계해보세요.
// 예를 들어, 작업의 상태(Status), 우선순위(Priority)를 표현할 열거형(enum)이나
// 작업 자체를 나타낼 구조체(struct)를 만들 수 있습니다.
enum Priority {
    case first, second, third
}

enum Status {
    case before    // 진행 전
    case ongoing    // 진행 중
    case completed   // 완료
}


// 작업 정보: 작업 상태, 마감기한, 시작기한, 내용, 식별번호, 우선순위
struct Task {
    var taskStatus: Status
    var taskPriority: Priority
    let exp: Date?
    let start: Date
    let content: String
    let id: UUID

    init(_ content:String, _ taskPriority: Priority, _ taskStatus: Status, _ start: Date) {
        self.id = UUID()
        self.content = content
        self.taskPriority = taskPriority
        self.taskStatus = taskStatus
        self.start = start
        self.exp = nil
    }
}

extension Task {
    init(_ content:String, _ taskPriority: Priority, _ taskStatus: Status, _ start: Date, _ exp: String) {
        self.id = UUID()
        self.content = content
        self.taskPriority = taskPriority
        self.taskStatus = taskStatus
        self.start = start
        
        var dateComponents = DateComponents()
        dateComponents.year = Int(exp.prefix(4))
        let expMonthAndDay = exp.suffix(4)
        dateComponents.month = Int(expMonthAndDay.prefix(2))
        dateComponents.day = Int(expMonthAndDay.suffix(2))

        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Seoul")!
        let expDate = calendar.date(from: dateComponents)
        self.exp = expDate
    }
}

extension DateFormatter {
    static let seoul: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        return formatter
    }()
}



// --- 작업 관리자 구현 공간 ---
// 설계한 데이터 구조를 바탕으로 작업 관리자(TaskManager)를 구현하세요.
// TaskManager는 작업들을 저장하고 관리하는 여러 메서드를 가집니다.

struct TaskManager {
    // TODO: 작업들을 저장할 컬렉션을 선언하세요. (예: [Task])
    var tasks : [Task] = []

    // TODO: 요구 기능에 명시된 메서드들을 구현하세요.
    // 1. 새로운 작업 추가
    mutating func addTask(task: Task) {
        var comment = "새로운 작업 추가 \n 내용: \(task.content) / 우선순위: \(task.taskPriority)"
        if task.exp != nil {
            comment += " / 마감기한: \(DateFormatter.seoul.string(from: task.exp!))"
        }
        print(comment)
        tasks.append(task)
    }
    // 2. 작업 상태 변경
    mutating func updateTaskStatus(id: UUID, status: Status) {
        for i in 0..<tasks.count {
            if tasks[i].id == id {
                print("이전 상태")
                print("작업 내용: \(tasks[i].content) / 상태 : \(tasks[i].taskStatus)")
                tasks[i].taskStatus = status
                print("이후 상태")
                print("작업 내용: \(tasks[i].content) / 상태 : \(tasks[i].taskStatus)")
            }
        }
    }
    // 3. 전체 작업 목록 보기
    func listAllTasks() {
        for task in tasks {
            var taskContent = "작업 내용: \(task.content) / 상태: \(task.taskStatus) / 우선 순위: \(task.taskPriority) / 시작일: \(DateFormatter.seoul.string(from: task.start))"
            if let exp = task.exp  {
                taskContent += " / 마감일 \(DateFormatter.seoul.string(from: exp))"
            }
            print(taskContent)
        }
    }
    // 4. 우선순위로 필터링하기
    func filterByPriority(priority: Priority) {
        let filterTasks = tasks.filter { $0.taskPriority == priority}
        for task in filterTasks {
            var taskContent = "작업 내용: \(task.content) / 상태: \(task.taskStatus) / 우선 순위: \(task.taskPriority) / 시작일: \(DateFormatter.seoul.string(from: task.start))"
            if let exp = task.exp  {
                taskContent += " / 마감일 \(DateFormatter.seoul.string(from: exp))"
            }
            print(taskContent)
        }
    }
    // 5. 완료된 작업 삭제
    mutating func removeCompletedTasks() {
        let notCompletedTasks = tasks.filter { $0.taskStatus != Status.completed}
        tasks.removeAll()
        tasks = notCompletedTasks.map { $0 }

        print("전체 작업 목록")
        self.listAllTasks()
    }
    // 6. (도전 과제) 마감 임박 작업 찾기

    func findUrgentTasks(_ currentDate: Date) {
        for task in tasks {
            guard let taskExp = task.exp else {
                continue
            }
            let interval = taskExp.timeIntervalSince(currentDate)
            let intervalDays = Int(interval / 86400)
            if intervalDays <= 1 {
                print( "작업 내용: \(task.content) / 상태: \(task.taskStatus) / 우선 순위: \(task.taskPriority) / 시작일: \(DateFormatter.seoul.string(from: task.start)) / 마감일 \(DateFormatter.seoul.string(from: taskExp))")
            }
        }
    }
}


// --- 실행 및 테스트 공간 ---
// 이 아래 부분에 테스트 코드를 작성하여 구현한 기능들을 검증하세요.

print("개인 작업 관리자를 시작합니다.")

print("1. TaskManager 인스턴스 생성")
var myTaskManager = TaskManager()
let currentDate =  Date()

print("2. 여러 작업 추가 테스트")
let task1 = Task("1", .first, .before, currentDate, "20250715")
let task2 = Task("2", .second, .completed,  currentDate,  "20250718")
let task3 = Task("3", .third, .before,  currentDate,  "20250718")
let task4 = Task("4", .third, .ongoing,  currentDate,  "20250716")
let task5 = Task("5", .second, .completed,  currentDate,  "20250714")
let task6 = Task("6", .second, .before,  currentDate,  "20250716")
let task7 = Task("7", .second, .completed,  currentDate)
let task8 = Task("8", .second, .before,  currentDate)
myTaskManager.addTask(task: task1)
myTaskManager.addTask(task: task2)
myTaskManager.addTask(task: task3)
myTaskManager.addTask(task: task4)
myTaskManager.addTask(task: task5)
myTaskManager.addTask(task: task6)
myTaskManager.addTask(task: task7)
myTaskManager.addTask(task: task8)

print("3. 전체 목록 출력 테스트")
myTaskManager.listAllTasks()


print("4. 작업 상태 변경 테스트")
myTaskManager.updateTaskStatus(id: task3.id, status: .ongoing)

print("5. 우선순위 필터링 테스트")
myTaskManager.filterByPriority(priority: .third)


print("6. 완료된 작업 삭제 테스트")
myTaskManager.removeCompletedTasks()


print("7. (도전 과제) 마감 임박 작업 찾기 테스트")
myTaskManager.findUrgentTasks(currentDate)