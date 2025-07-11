

/*
//
// solution.swift
// SwiftLibraryChallenge
//
// 이 파일은 과제에 대한 전체 정답 예시 코드와 해설을 담고 있습니다.
// 자신의 코드를 작성한 후, 이 파일의 주석을 해제하여 비교하고 학습해 보세요.
//

import Foundation

// ---
// MARK: - Media.swift: 프로토콜 및 데이터 타입 구현
// ---


// 요구사항 1 & 3: Media 프로토콜 및 프로토콜 확장
// Equatable을 채택하여 '==' 연산자를 사용할 수 있게 합니다.
// Comparable을 채택하여 인스턴스 간 크기 비교(정렬)가 가능하게 합니다. (보너스 과제)
protocol Media: Equatable, Comparable {
    var id: UUID { get }
    var title: String { get set }
    var author: String { get set }

    func getDetails() -> String
}

// 프로토콜 확장을 통해 프로토콜을 따르는 모든 타입에 기본 구현을 제공합니다.
extension Media {
    // 기본 id 값 제공
    var id: UUID { UUID() }

    // Equatable 기본 구현: id가 같으면 같은 객체로 취급
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    // Comparable 기본 구현: 제목(title)을 기준으로 오름차순 정렬 (보너스 과제)
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.title < rhs.title
    }
}

// 요구사항 1: Book 구조체 구현
struct Book: Media {
    var title: String
    var author: String
    var pageCount: Int

    func getDetails() -> String {
        return "[책] \"\(title)\" - 저자: \(author), \(pageCount)페이지"
    }
}

// 요구사항 1: Magazine 구조체 구현
struct Magazine: Media {
    var title: String
    var author: String
    var issueNumber: Int

    func getDetails() -> String {
        return "[잡지] \"\(title)\" - 편집장: \(author), \(issueNumber)호"
    }
}



// ---
// MARK: - Library.swift: 라이브러리 관리 시스템 구현
// ---


// 요구사항 2: Library 구조체 구현
struct Library {
    private(set) var items: [Media] = []

    mutating func add(media: Media) {
        items.append(media)
        print("'\(media.title)'이(가) 라이브러리에 추가되었습니다.")
    }

    func listAllMedia() {
        print("\n--- 전체 미디어 목록 ---")
        guard !items.isEmpty else {
            print("라이브러리가 비어있습니다.")
            return
        }
        for media in items {
            print(media.getDetails())
        }
        print("----------------------\n")
    }
    
    // 보너스 과제: 제목순으로 정렬된 미디어 목록 반환
    func listMediaSortedByTitle() {
        print("\n--- 제목순 정렬된 미디어 목록 ---")
        guard !items.isEmpty else {
            print("라이브러리가 비어있습니다.")
            return
        }
        // Media가 Comparable을 준수하므로 sorted() 메소드를 바로 사용할 수 있습니다.
        for media in items.sorted() {
            print(media.getDetails())
        }
        print("----------------------------\n")
    }
}

// 요구사항 4: Library 타입 확장
extension Library {
    func listAuthors() {
        print("\n--- 전체 저자 목록 (중복 없음) ---")
        guard !items.isEmpty else {
            print("저자 정보가 없습니다.")
            return
        }
        // Set을 사용하여 중복을 자동으로 제거합니다.
        let allAuthors = Set(items.map { $0.author })
        for author in allAuthors.sorted() {
            print("- \(author)")
        }
        print("----------------------------------\n")
    }
}



// ---
// MARK: - main.swift: 시스템 실행
// ---


// 요구사항 5: 시스템 실행

// 1. 라이브러리 인스턴스 생성
var myLibrary = Library()

// 2. 여러 미디어 생성 및 추가
let book1 = Book(title: "Swift Programming: The Big Nerd Ranch Guide", author: "Matthew Mathias", pageCount: 552)
let book2 = Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", pageCount: 1178)
let magazine1 = Magazine(title: "National Geographic", author: "Susan Goldberg", issueNumber: 241)
let magazine2 = Magazine(title: "Time", author: "Edward Felsenthal", issueNumber: 100)

myLibrary.add(media: book1)
myLibrary.add(media: book2)
myLibrary.add(media: magazine1)
myLibrary.add(media: magazine2)

// 3. 전체 미디어 목록 출력
myLibrary.listAllMedia()

// 4. 전체 저자 목록 출력
myLibrary.listAuthors()

// 5. (보너스) 제목순으로 정렬된 미디어 목록 출력
myLibrary.listMediaSortedByTitle()

// Equatable 테스트
let anotherBook = Book(title: "A Game of Thrones", author: "George R. R. Martin", pageCount: 694)
print("book1과 book2는 같은 책인가? \(book1 == book2)") // false

// Media 배열에 다른 타입의 객체가 함께 저장되는 것을 확인
let firstItem = myLibrary.items[0]
if firstItem is Book {
    print("첫 번째 아이템은 책입니다.")
}
*/
