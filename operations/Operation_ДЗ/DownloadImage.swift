
import Foundation
import UIKit

let cache = NSCache<AnyObject, AnyObject>()
class DownloadImage: Operation {

    static let shared = DownloadImage()
    let imageView = CustomImageView()

    private override init() {}

    var task: URLSessionTask!
    var operationQueue = OperationQueue()

    func loadImage(from url: URL) {

        imageView.image = nil

        if let task = task {
            task.cancel()
        }

        operationQueue.addOperation {
            if let imageFromCache = cache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
                self.imageView.image = imageFromCache
                return
            }

            self.task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard let data = data, let image = UIImage(data: data) else { return }

                cache.setObject(image, forKey: url.absoluteString as AnyObject)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
            self.task.resume()
        }
    }

}
