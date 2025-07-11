import Foundation

protocol Media: Equatable, Comparable {
    var id: UUID { get }
    var title: String { get set}
    var author: String { get set }
    func getDetails() -> String

}

extension Media {
    var id: UUID {
        UUID()
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.title < rhs.title
    }
}

struct Book: Media {
    var title: String
    var author: String
    var pageCount: Int

    func getDetails() -> String {
        return "Title: \(title), author: \(author), pageCount: \(pageCount)"
    }
}

struct Magazine: Media {
    var title: String
    var author: String
    var issueNumber: Int

    func getDetails() -> String {
        return "Title: \(title), author: \(author), issueNumber: \(issueNumber)"
    }
}