

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.example.com"

    func fetchUser(userID: Int, completion: @escaping (Result<User, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/users/\(userID)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
