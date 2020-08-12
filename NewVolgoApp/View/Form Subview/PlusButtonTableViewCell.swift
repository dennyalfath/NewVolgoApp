//
//  PlusButtonTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

protocol PlusButtonTableViewCellDelegate: class {
    func didTapTheButton()
}

class PlusButtonTableViewCell: UITableViewCell {

    //Set delegate
    weak var delegate: PlusButtonTableViewCellDelegate!
    
    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "PlusButtonTableViewCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "PlusButtonTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func plusButtonTapped(_ sender: UIButton) {
        delegate.didTapTheButton()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
