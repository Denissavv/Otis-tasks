import Foundation
import CoreData

protocol ModelFactory {
    func createUser(from networkData: Data) throws -> User
    func createUserEntity(from user: User, in context: NSManagedObjectContext) -> NSManagedObject
}

class MyModelFactory: ModelFactory {
    func createUser(from networkData: Data) throws -> User {
        return try JSONDecoder().decode(User.self, from: networkData)
    }

    func createUserEntity(from user: User, in context: NSManagedObjectContext) -> NSManagedObject {
        let newUserEntity = UserEntity(context: context)
        newUserEntity.id = Int(user.id)
        newUserEntity.username = user.username
        newUserEntity.email = user.email
        return newUserEntity
    }
}
