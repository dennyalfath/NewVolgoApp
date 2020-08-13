//
//  GoalViewController.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var goal = GoalModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register table view custom cell that has been made
        tableView.register(CardListTableViewCell.nib(), forCellReuseIdentifier: CardListTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal.retrieve()!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as! CardListTableViewCell
        cell.selectionStyle = .none
        cell.cardBackground.layer.cornerRadius = 10
        cell.cardLabel.text = "Make 4 new friends"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

extension GoalViewController: GoalModelDelegate {
    func updateGoal(goal: Goal) {
        tableView.reloadData()
    }
}
