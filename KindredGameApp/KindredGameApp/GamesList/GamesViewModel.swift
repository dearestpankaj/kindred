import Foundation

/// ViewModel for GamesViewController
class GamesViewModel {
    typealias Completion = ([Game]?, CustomError?) -> Void
    let remoteDatasource = GamesRemoteDataSource()
    
    /// Get games from remote datasource
    ///
    /// - Parameter completion: completion handler
    func getGames(completion:@escaping Completion){
        remoteDatasource.getGameList { (games, error) in
            completion(games,error)
        }
    }
    
}
