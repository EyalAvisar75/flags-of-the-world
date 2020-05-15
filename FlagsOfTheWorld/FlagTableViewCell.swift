import UIKit

class FlagTableViewCell: UITableViewCell {

    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with flag:Flag){
        flagLabel.text = flag.flag
        countryLabel.text = flag.country
        regionLabel.text = "Located in \(flag.region) with a population of \(flag.population)."
        
    }

}
