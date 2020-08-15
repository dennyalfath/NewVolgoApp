//
//  ViewController.swift
//  datepicker
//
//  Created by Jogi Oktavianus on 16/08/20.
//  Copyright © 2020 Jogi Oktavianus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePicker.Mode.date
            
            datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
            dateTextField.inputView = datePicker
        }

    @objc func datePickerValueChanged(sender: UIDatePicker){
          let formatter = DateFormatter()
          
          formatter.dateStyle = DateFormatter.Style.medium
          
          formatter.timeStyle = DateFormatter.Style.none
          
          dateTextField.text = formatter.string(from: sender.date)
      }
}

