//
//  AddGoalViewController.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var goalModel = GoalModel()
    var goalBreakdownModel = GoalBreakdownModel()
    
    var goalTextField = UITextField()
    var activeTextField = UITextField()
    var breakdownTextField = UITextField()
    var deadline: Bool = false
    var duedate: UIDatePicker?
    
    var goalTextString: String?
    
    //Set the name of indexPath or Row with name to make it simple
    var arrayOfContent: [String] = ["firstRowMarginCell", "goalCell", "subheadingCell", "recommendationCell", "labelCell", "breakdownCell", "plusButtonCell", "switchLabelCell"]
    
    var breakdownList: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup table view (the important thing is only delegate and dataSource)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        //Register custom table view cell
        tableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(BreakdownTextFieldTableViewCell.nib(), forCellReuseIdentifier: BreakdownTextFieldTableViewCell.identifier)
        tableView.register(SubheadingTableViewCell.nib(), forCellReuseIdentifier: SubheadingTableViewCell.identifier)
        tableView.register(RecommendationTableViewCell.nib(), forCellReuseIdentifier: RecommendationTableViewCell.identifier)
        tableView.register(LabelOnlyTableViewCell.nib(), forCellReuseIdentifier: LabelOnlyTableViewCell.identifier)
        tableView.register(PlusButtonTableViewCell.nib(), forCellReuseIdentifier: PlusButtonTableViewCell.identifier)
        tableView.register(SwitchLabelTableViewCell.nib(), forCellReuseIdentifier: SwitchLabelTableViewCell.identifier)
        tableView.register(DatePickerTableViewCell.nib(), forCellReuseIdentifier: DatePickerTableViewCell.identifier)
    }
    
    //This function means how many rows we want to add to the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContent.count
    }
    
    //This function helps us to do something with the row we choose
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrayOfContent[indexPath.row] == "firstRowMarginCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstRowMarginCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "goalCell" {
            //Define the cell with the registered custom cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.selectionStyle = .none
            
            //Set textfield display properties
            cell.textField.placeholder = "Eg. make 4 new friends"
            cell.textField.text = goalTextString
            goalTextField = cell.textField
            goalTextField.delegate = self
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "subheadingCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: SubheadingTableViewCell.identifier, for: indexPath) as! SubheadingTableViewCell
            cell.selectionStyle = .none
            cell.labelBackground.layer.cornerRadius = 10
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "recommendationCell" {
            let recommendationCell = tableView.dequeueReusableCell(withIdentifier: RecommendationTableViewCell.identifier, for: indexPath) as! RecommendationTableViewCell
            recommendationCell.selectionStyle = .none
            recommendationCell.delegate = self
            return recommendationCell
        }
            
        else if arrayOfContent[indexPath.row] == "labelCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: LabelOnlyTableViewCell.identifier, for: indexPath) as! LabelOnlyTableViewCell
            cell.selectionStyle = .none
            cell.labelOnly.text = "Breakdown your goal into steps:"
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "breakdownCell" {
            let breakdownCell = tableView.dequeueReusableCell(withIdentifier: BreakdownTextFieldTableViewCell.identifier, for: indexPath) as! BreakdownTextFieldTableViewCell
            breakdownCell.selectionStyle = .none
            breakdownCell.bdTextField.placeholder = "Breakdown your goal here"
            
            // set cell textfield sebagai breakdown textfield
            breakdownTextField = breakdownCell.bdTextField
            breakdownCell.bdTextField.delegate = self
            
            // set breakdown list value per index
            let breakdownIndex = indexPath.row - 5
            breakdownList[breakdownIndex] = breakdownCell.bdTextField.text!
            
//            print("row: \(indexPath.row), index: \(indexPaths)")
//            print("value: \(breakdownValue)")
            
            return breakdownCell
        }
            
        else if arrayOfContent[indexPath.row] == "plusButtonCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlusButtonTableViewCell.identifier, for: indexPath) as! PlusButtonTableViewCell
            cell.selectionStyle = .none
            cell.plusButton.layer.cornerRadius = cell.plusButton.frame.width / 2
            cell.delegate = self
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "switchLabelCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchLabelTableViewCell.identifier, for: indexPath) as! SwitchLabelTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
            
        else if arrayOfContent[indexPath.row] == "datePickerCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.identifier, for: indexPath) as! DatePickerTableViewCell
            cell.selectionStyle = .none
            duedate = cell.datePickerOutlet
            return cell
        }
        
        //Will never be called
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfContent[indexPath.row] == "firstRowMarginCell" {
            return 30
        }
        
        if arrayOfContent[indexPath.row] == "goalCell" {
            return 60
        }
            
        else if arrayOfContent[indexPath.row] == "recommendationCell" {
            return 550
        }
            
        else if arrayOfContent[indexPath.row] == "breakdownCell" {
            return 60
        }
            
        else if arrayOfContent[indexPath.row] == "plusButtonCell" {
            return 60
        }
            
        else if arrayOfContent[indexPath.row] == "datePickerCell" {
            return 300
        }
        
        return UITableView.automaticDimension
    }
    
    // MARK: - Done button pressed

    @IBAction func doneBtnPressed(_ sender: UIBarButtonItem) {
        print(goalTextField.text!)
        print(breakdownList)
        print(deadline)
        
        tableView.reloadData()
        
        let newGoal = goalModel.create(title: goalTextField.text!, deadline: deadline, dueDate: duedate?.date)
        
        for breakdown in breakdownList {
            goalBreakdownModel.create(breakdown: breakdown, parentGoal: newGoal)
        }

    }
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddGoalViewController: PlusButtonTableViewCellDelegate {
    
    func didTapTheButton() {
        arrayOfContent.insert("breakdownCell", at: arrayOfContent.index(after: 5))
        // tambah list baru untuk breakdown
        breakdownList.append("")
        tableView.reloadData()
    }
}

extension AddGoalViewController: SwitchLabelTableViewCellDelegate {
    
    func didChangeValueSwitch(state: Bool) {
        if state {
            arrayOfContent.insert("datePickerCell", at: arrayOfContent.endIndex)
            deadline = true
        } else {
            arrayOfContent.remove(at: arrayOfContent.endIndex - 1)
            deadline = false
            duedate = nil
        }
        
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: arrayOfContent.endIndex - 1, section: 0), at: .bottom, animated: true)
    }
    
}

extension AddGoalViewController: RecommendationTableViewCellDelegate {
    
    func btnTapped(title: String) {
        goalTextString = title
        tableView.reloadData()
    }
}

extension AddGoalViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if activeTextField == goalTextField {
            goalTextString = goalTextField.text
        } else {
            tableView.reloadData()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
}
