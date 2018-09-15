import UIKit

/// custom UITableViewCell for Game
class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var imgvwGame: UIImageView!
    @IBOutlet weak var lblGameTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// setup game cell
    ///
    /// - Parameter game: Game model
    func setup(_ game: Game) {
        lblGameTitle.text = game.gameName
    }
}
