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
    var arrayOfContent: [String] = ["goalCell", "subheadingCell", "recommendationCell", "breakdownCell", "deadlineCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        //Register custom table view cell
        tableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
    }
    
    //This function means how many row we want to add to the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContent.count
    }
    
    //This function helps us to do something with the row we choose
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfContent[indexPath.row] == "goalCell" {
            
            //Define the cell with the registered custom cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.selectionStyle = .none
            
            //Set textfield display properties
            cell.textField.placeholder = "Eg. make 4 new friends"
            
            return cell
        }
        
        //Will never be called
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfContent[indexPath.row] == "goalCell" {
            return 70
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
