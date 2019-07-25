import UIKit

class AnimePageController: UIViewController {
    
    @IBOutlet var nom: UILabel!
    @IBOutlet var prequel: UILabel!
    @IBOutlet var sequel: UILabel!
    @IBOutlet var episode: UILabel!
    @IBOutlet var picture: UIImageView!
    
    var input : MyAnimeDatabase.AnimeElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nom.text = input.nom
        self.sequel.text = input.sequel
        self.prequel.text = input.prequel
        self.episode.text = String(input.episode)
        if let url = NSURL(string : input.url) {
            if let data = NSData(contentsOf: url as URL) {
                picture.contentMode = UIView.ContentMode.scaleAspectFit
                picture.image = UIImage(data: data as Data)
            }
        }
    }
    
}
