//
//  BreakdownTextFieldTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 15/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class BreakdownTextFieldTableViewCell: UITableViewCell {

    static let identifier = "BreakdownTextFieldTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BreakdownTextFieldTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var bdTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
