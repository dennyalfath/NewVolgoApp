//
//  GoalModel.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import CoreData

struct GoalModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func create(title: String, deadline: Bool, dueDate: Date?) -> Goal {
        let newGoal = Goal(context: context)
        do {
            newGoal.id = UUID()
            newGoal.title = title
            newGoal.deadline = deadline
            if let date = dueDate {
                newGoal.duedate = date
            }
            try context.save()
        } catch {
            print("Error saving data \(error)")
        }
        return newGoal
    }
    
    func retrieve() -> [Goal]? {
        let request: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error retrieving data\(error)")
        }
        return nil
    }
    
}
