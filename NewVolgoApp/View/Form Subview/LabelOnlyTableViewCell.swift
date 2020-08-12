//
//  LabelOnlyTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class LabelOnlyTableViewCell: UITableViewCell {

    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "LabelOnlyTableViewCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "LabelOnlyTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var labelOnly: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
