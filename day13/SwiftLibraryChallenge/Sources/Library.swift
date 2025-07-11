import Foundation

struct Library {
    var items: [any Media] = []

    mutating func add(media: any Media) {
        self.items.append(media)
    }

    func listAllMedia() {
        for item in items {
            print(item.getDetails())
        }
    }
}

extension Library {
    mutating func listAuthors() {
        var authors: Set<String> = []
        for item in items {
            authors.insert(item.author)
        }
        for author in authors {
            print(author)
        }
    }

    mutating func listMediaSortedByTitle() {
        self.items.sort { $0.title < $1.title}
    }
}