import Foundation
@testable import KindredGameApp

/// Mock NetworkManager with data from json file
class MockNetworkManager: NetworkManager {
    var isSuccess:Bool = false
    
    /// Get gamelist data from json file for unit test cases
    ///
    /// - Parameters:
    ///   - requestURL: gamelist api url
    ///   - completion: completion handler
    override func getRequest(requestURL:String, completion:@escaping Completion) {
        if isSuccess {
            if let path = Bundle.main.url(forResource: "gameList", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]{
                        completion(jsonResponse,nil)
                    }else{
                        completion(nil,CustomError(.errDefault))
                    }
                } catch {
                    completion(nil,CustomError(.errDefault))
                }
            }
        }else{
            completion(nil,CustomError(.errDefault))
        }
    }
}
