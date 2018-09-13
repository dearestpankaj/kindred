import Foundation

/// Game model for game list
struct Game {
    var gameName:String
    var gameId:String
    var imageUrl:String
}

// MARK: - extension Game
/// init function inside Game as default constructor
extension Game{
    init?(json: [String:AnyObject]) {
        guard let gameId = json["gameId"] as? String,
            let gameName = json["gameName"] as? String,
            let imageUrl = json["imageUrl"] as? String else {
            return nil
        }
        self.gameName = gameName
        self.gameId = gameId
        self.imageUrl = imageUrl
    }
}
