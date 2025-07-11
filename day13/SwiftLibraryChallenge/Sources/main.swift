// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

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
