//
//  DatePickerTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

protocol DatePickerTableViewDelegate: class {
    func getDate()
}

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
    weak var delegate: DatePickerTableViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        datePickerLabel.textColor = UIColor.systemBlue
        datePickerLabel.attributedText = NSAttributedString(string: "Text", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        date = formattedString(date: datePickerOutlet.date)
        datePickerLabel.text = date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formattedString(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, d MMM yyyy"
        return df.string(from: date)
    }
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        date = formattedString(date: sender.date)
        datePickerLabel.text = date
        delegate.getDate()
    }
}
