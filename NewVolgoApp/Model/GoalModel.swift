//
//  GoalModel.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import CoreData

protocol GoalModelDelegate {
    func updateGoal(goal: Goal)
}

struct GoalModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //    func create(_ title: String, _ deadline: Bool, _ dueDate: Date) -> Goal {
    //        let newGoal = Goal(context: context)
    //        do {
    //            newGoal.id = UUID()
    //            newGoal.title = title
    //            newGoal.deadline = deadline
    //            newGoal.duedate = dueDate
    //
    //            try context.save()
    //        } catch {
    //            print(error)
    //        }
    //        return newGoal
    //    }
    
    func create(_ title: String, _ deadline: Bool, _ dueDate: Date) {
        let goalEntity = NSEntityDescription.entity(forEntityName: "Goal", in: context)
        let newGoal = NSManagedObject(entity: goalEntity!, insertInto: context)
        newGoal.setValue(title, forKey: "title")
        newGoal.setValue(deadline, forKey: "deadline")
        newGoal.setValue(dueDate, forKey: "duedate")
        
        do {
            // save data ke entity user core data
            try context.save()
        } catch let err{
            print(err)
        }
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
