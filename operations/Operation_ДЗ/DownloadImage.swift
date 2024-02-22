import Foundation
import UIKit

let cache = NSCache<AnyObject, AnyObject>()
class DownloadImage: Operation {

    static let shared = DownloadImage()
    let imageView = CustomImageView()

    private override init() {}

    private static var sharedOperationQueue: OperationQueue = {
        let queue = OperationQueue()
        return queue
    }()

    var task: URLSessionTask!

    func loadImage(from url: URL) {

        imageView.image = nil

        if let task = task {
            task.cancel()
        }

        DownloadImage.sharedOperationQueue.addOperation {
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
