import Foundation

/// Class to handle network calls
class NetworkManager {
    typealias Completion = ([String:AnyObject]?, CustomError?) -> Void
    
    /// Download json reponse from api
    ///
    /// - Parameters:
    ///   - requestURL: request url
    ///   - completion: completion handler
    class func getRequest(requestURL:String, completion:@escaping Completion){
        if let url = URL(string: requestURL){
            let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    do{
                        if let jsonData = data{
                            if let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:AnyObject]{
                                completion(jsonResponse,nil)
                                return
                            }
                        }
                    }
                    catch{
                        completion(nil, CustomError(.errDefault))
                    }
                }
                completion(nil, CustomError(.errDefault))
            }
            session.resume()
        }
    }
}
