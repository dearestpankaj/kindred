import Foundation

/// Game model for game list
class Game {
    var gameName:String!
    var gameId:String!
    var imageUrl:String!
    
    init(gameId:String, gameName:String, imageUrl:String) {
        self.gameName = gameName
        self.gameId = gameId
        self.imageUrl = imageUrl
    }
}
