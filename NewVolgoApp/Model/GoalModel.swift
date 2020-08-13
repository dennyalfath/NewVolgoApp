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
    
    func create(_ title: String, _ deadline: Bool, _ dueDate: Date) -> Goal {
        let newGoal = Goal(context: context)
        do {
            newGoal.id = UUID()
            newGoal.title = title
            newGoal.deadline = deadline
            newGoal.duedate = dueDate
            
            try context.save()
        } catch {
            print(error)
        }
        return newGoal
    }
    
    func retrieve() -> [Goal]? {
        let request: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error")
        }
        return nil
    }
    
}
