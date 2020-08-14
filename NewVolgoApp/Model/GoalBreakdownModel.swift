//
//  GoalBreakdownModel.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 13/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import CoreData

struct GoalBreakdownModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    func create(_ breakdown: String) -> GoalBreakdown {
//        let newGoalBreakdown = GoalBreakdown(context: context)
//        do {
//            newGoalBreakdown.id = UUID()
//            newGoalBreakdown.breakdown = breakdown
//
//            try context.save()
//        } catch {
//            print(error)
//        }
//        return newGoalBreakdown
//    }
    func create(_ breakdown: String) {
        let goalBreakdownEntity = NSEntityDescription.entity(forEntityName: "GoalBreakdown", in: context)
        let newGoalBreakdown = NSManagedObject(entity: goalBreakdownEntity!, insertInto: context)
        newGoalBreakdown.setValue(breakdown, forKey: "breakdown")
        
        do {
            // save data ke entity user core data
            try context.save()
        } catch let err{
            print(err)
        }
    }
    
    func retrieve() -> [GoalBreakdown]? {
        let request: NSFetchRequest<GoalBreakdown> = GoalBreakdown.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error")
        }
        return nil
    }
}
