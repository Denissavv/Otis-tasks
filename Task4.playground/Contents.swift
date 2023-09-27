import UIKit



struct User {
    var name: String;
    var id: Int;
    var age: Int
};


var users: Array<User> = [
    User(name: "Slava", id: 1, age: 30),
    User(name: "Vlad", id: 2, age: 31),
    User(name: "Dima", id: 3, age: 30),
]

for user in users {
    print("Имя пользователя: \(user.name)")
    print("Возраст пользователя: \(user.age)")
}


if users.count > 1 {
    users[1].name = "Andrew";
    users[1].age = 34
}


for user in users {
    print("Имя пользователя: \(user.name)")
    print("Возраст пользователя: \(user.age)")
}

