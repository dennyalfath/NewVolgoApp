//
//  CardListTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class CardListTableViewCell: UITableViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "CardListTableViewCell", bundle: nil)
    }
    
    static let identifier = "CardListTableViewCell"
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardCheckImage: UIImageView!
    @IBOutlet weak var cardDisclosureImage: UIImageView!
    @IBOutlet weak var cardBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
