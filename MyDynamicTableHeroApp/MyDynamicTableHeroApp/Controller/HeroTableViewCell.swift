//
//  HeroTableViewCell.swift
//  MyDynamicTableHeroApp
//
//  Created by Patricia Fiona on 23/07/21.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var descHero: UILabel!
    @IBOutlet weak var photoHero: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
