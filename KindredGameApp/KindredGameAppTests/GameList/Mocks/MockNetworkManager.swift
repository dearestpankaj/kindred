import Foundation
@testable import KindredGameApp

class MockNetworkManager: NetworkManager {
    var isSuccess:Bool = false
    
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
