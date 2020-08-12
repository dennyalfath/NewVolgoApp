//
//  TextFieldTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "TextFieldCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "TextFieldTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
