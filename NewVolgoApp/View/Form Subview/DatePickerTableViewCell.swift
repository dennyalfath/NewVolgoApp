//
//  DatePickerTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    
    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "DatePickerTableViewCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "DatePickerTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    var date: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        datePickerLabel.textColor = UIColor.systemBlue
        datePickerLabel.attributedText = NSAttributedString(string: "Text", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        date = DateFormatterHelper.dateFormatterToString(date: datePickerOutlet.date)
        datePickerLabel.text = date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        date = DateFormatterHelper.dateFormatterToString(date: sender.date)
        datePickerLabel.text = date
    }
}
