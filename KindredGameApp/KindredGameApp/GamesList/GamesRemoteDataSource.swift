import Foundation

/// Remote datasource layer to fetch games api response
class GamesRemoteDataSource {
    let baseURLString: String = "https://api.unibet.com/"
    typealias Completion = ([Game]?, CustomError?) -> Void
    
    
    /// request list of games as Game model array
    ///
    /// - Parameter completion: completion handler
    func getGameList(completion:@escaping Completion){
        NetworkManager.getRequest(requestURL: getGamesURL()) {[weak self] (jsonResponse, error) in
            if error == nil, let response = jsonResponse,
                let games = response["games"] as? [String:AnyObject] {
                let arrGames = self?.parseJSONResponse(response: games)
                if (arrGames?.count)! > 0{
                    completion(self?.parseJSONResponse(response: games),nil)
                }else{
                    completion(nil,CustomError(.errNoDataFound))
                }
            }else{
                completion(nil,error)
            }
        }
    }
    
    /// parse JSON response to Game Model
    ///
    /// - Parameter response: json response from api
    /// - Returns: array of Game model
    private func parseJSONResponse(response:[String:AnyObject]) -> [Game]{
        var arrGames = [Game]()
        for (_,val) in response{
            if let gameID = val["gameId"] as? String,
                let gameName = val["gameName"] as? String,
                let imageUrl = val["imageUrl"] as? String{
                let game = Game(gameId: gameID, gameName: gameName, imageUrl: imageUrl)
                arrGames.append(game)
            }
        }
        return arrGames
    }
    
    /// Get url of the game list api
    ///
    /// - Returns: api url
    private func getGamesURL() -> String{
        return baseURLString + "game-library-rest-api/getGamesByMarketAndDevice.json?jurisdiction=UK&brand=unibet&deviceGroup=mobilephone&locale=en_GB&currency=GBP&categories=casino,softgames&clientId=casinoapp"
    }
}
