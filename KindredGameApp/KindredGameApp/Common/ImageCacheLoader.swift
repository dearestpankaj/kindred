import UIKit

typealias ImageCacheLoaderCompletionHandler = ((UIImage) -> ())

/// Download images and save in cache with url as key
class ImageCacheLoader {
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()
    }
    
    /// Get UImage from url
    ///
    /// - Parameters:
    ///   - imagePath: url of image
    ///   - completionHandler: completion handler, called when image download is complete
    func getImageWithPath(imagePath: String, completionHandler: @escaping ImageCacheLoaderCompletionHandler) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = #imageLiteral(resourceName: "placeholder-image")
            DispatchQueue.main.async {
                completionHandler(placeholder)
            }
            if let url = URL(string: imagePath){
                task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                    if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                        self.cache.setObject(img, forKey: imagePath as NSString)
                        DispatchQueue.main.async {
                            completionHandler(img)
                        }
                    }
                })
                task.resume()
            }
        }
    }
}
