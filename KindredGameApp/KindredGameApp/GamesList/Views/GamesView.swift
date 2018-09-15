import UIKit
///Display list of games in UITableView
class GamesView: UIViewController {
    @IBOutlet weak var tblvwGames: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let imgLoader = ImageCacheLoader()
    var viewmodel = GamesViewModel()
    var arrGames = [Game](){
        didSet{
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.tblvwGames.isHidden = false
                self.tblvwGames.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGames()
    }
    
    /// download games and populate tableview
    private func getGames(){
        activityIndicator.startAnimating()
        viewmodel.getGames(completion: {[weak self] (games, error) in
            if error == nil, let gameList = games {
                self?.arrGames = gameList
            }else{
                self?.showErrorMessage(errorMsg: (error?.errorType.rawValue)!)
            }
        })
    }
    
    /// if error is not nil, display in alert
    ///
    /// - Parameter errorMsg: error message
    private func showErrorMessage(errorMsg:String){
        let alertController = UIAlertController(title: "Alert", message: errorMsg, preferredStyle:UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action -> Void in
        })
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension GamesView:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "gamesReuseIdentifier") as? GameTableViewCell{
            let model = arrGames[indexPath.row]
            cell.setup(model)
            imgLoader.getImageWithPath(imagePath:model.imageUrl) { (image) in
                cell.imgvwGame.image = image
            }
            return cell
        }
        return UITableViewCell()
    }
}
