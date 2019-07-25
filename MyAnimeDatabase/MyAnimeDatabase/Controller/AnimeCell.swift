import UIKit

class AnimeCell: UITableViewCell {
    
    @IBOutlet var titre: UILabel!
    @IBOutlet var episode: UILabel!
    @IBOutlet var prequel: UILabel!
    @IBOutlet var sequel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
