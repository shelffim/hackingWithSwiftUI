import UIKit

class User {
    var username = "Anonymous"
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

class DeepUser {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user3 = DeepUser()

var user4 = user3.copy()
user4.username = "Swift"

print(user3.username)
print(user4.username)

var message = "Welcome"
var greeting = message
greeting = "Hello"

print(message)
print(greeting)
