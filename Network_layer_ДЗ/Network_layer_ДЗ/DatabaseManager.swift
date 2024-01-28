import Foundation
import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
    @NSManaged public var id: Int
    @NSManaged public var username: String?
    @NSManaged public var email: String?
}


class DatabaseManager {
    static let shared = DatabaseManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelName")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()

    func saveUser(_ user: User) {
        let context = persistentContainer.viewContext
        let newUser = UserEntity(context: context)
        newUser.id = Int(user.id)
        newUser.username = user.username
        newUser.email = user.email

        do {
            try context.save()
        } catch {
            print("Error saving user: \(error)")
        }
    }

    func getUserByID(_ userID: Int) -> User? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest() as! NSFetchRequest<UserEntity>
        fetchRequest.predicate = NSPredicate(format: "id == %d", userID)

        do {
            let result = try context.fetch(fetchRequest)
            if let userEntity = result.first {
                return User(id: Int(userEntity.id), username: userEntity.username ?? "", email: userEntity.email ?? "")
            }
        } catch {
            print("Error fetching user: \(error)")
        }

        return nil
    }
}


