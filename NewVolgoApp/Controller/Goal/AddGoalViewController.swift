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
    
    //Set the name of indexPath or Row with name to make it simple
    var arrayOfContent: [String] = ["firstRowMarginCell", "goalCell", "subheadingCell", "recommendationCell", "labelCell", "breakdownCell", "plusButtonCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        //Register custom table view cell
        tableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(SubheadingTableViewCell.nib(), forCellReuseIdentifier: SubheadingTableViewCell.identifier)
        tableView.register(RecommendationTableViewCell.nib(), forCellReuseIdentifier: RecommendationTableViewCell.identifier)
        tableView.register(LabelOnlyTableViewCell.nib(), forCellReuseIdentifier: LabelOnlyTableViewCell.identifier)
        tableView.register(PlusButtonTableViewCell.nib(), forCellReuseIdentifier: PlusButtonTableViewCell.identifier)
    }
    
    //This function means how many row we want to add to the table view
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
        
        if arrayOfContent[indexPath.row] == "goalCell" {
            
            //Define the cell with the registered custom cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.selectionStyle = .none
            
            //Set textfield display properties
            cell.textField.placeholder = "Eg. make 4 new friends"
            
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
            return recommendationCell
        }
        
        else if arrayOfContent[indexPath.row] == "labelCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: LabelOnlyTableViewCell.identifier, for: indexPath) as! LabelOnlyTableViewCell
            cell.selectionStyle = .none
            cell.labelOnly.text = "Breakdown your goal into steps:"
            return cell
        }
        
        else if arrayOfContent[indexPath.row] == "breakdownCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.selectionStyle = .none
            cell.textField.placeholder = "Breakdown your goal here"
            return cell
        }
        
        else if arrayOfContent[indexPath.row] == "plusButtonCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlusButtonTableViewCell.identifier, for: indexPath) as! PlusButtonTableViewCell
            cell.selectionStyle = .none
            cell.plusButton.layer.cornerRadius = cell.plusButton.frame.width / 2
            cell.delegate = self
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
        
        return UITableView.automaticDimension
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AddGoalViewController: PlusButtonTableViewCellDelegate {
    
    func didTapTheButton() {
        arrayOfContent.insert("breakdownCell", at: arrayOfContent.index(before: arrayOfContent.endIndex))
        tableView.reloadData()
    }
    
}
