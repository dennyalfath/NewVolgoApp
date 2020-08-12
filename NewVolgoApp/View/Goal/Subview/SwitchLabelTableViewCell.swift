//
//  SwitchLabelTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

protocol SwitchLabelTableViewCellDelegate: class {
    func didChangeValueSwitch(state: Bool)
}

class SwitchLabelTableViewCell: UITableViewCell {

    weak var delegate: SwitchLabelTableViewCellDelegate!
    
    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "SwitchLabelTableViewCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "SwitchLabelTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        delegate.didChangeValueSwitch(state: sender.isOn)
    }
}
