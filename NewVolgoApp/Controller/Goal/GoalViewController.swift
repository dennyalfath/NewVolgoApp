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
    
    var goalModel = GoalModel()
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()

        //Setup the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register table view custom cell that has been made
        tableView.register(CardListTableViewCell.nib(), forCellReuseIdentifier: CardListTableViewCell.identifier)
        
        loadGoal()
    }
    
    func loadGoal() {
        if let loadedGoals = goalModel.retrieve() {
            goals = loadedGoals
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.identifier, for: indexPath) as! CardListTableViewCell
        cell.selectionStyle = .none
        cell.cardBackground.layer.cornerRadius = 10
        cell.cardLabel.text = goals[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goalsToAddGoal" {
            let destinationVC = segue.destination as! AddGoalViewController
            destinationVC.delegate = self
        }
    }

}

extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

extension GoalViewController: AddGoalViewControllerDelegate {
    func updateGoal(goal: Goal) {
        goals.append(goal)
        tableView.reloadData()
    }
}
