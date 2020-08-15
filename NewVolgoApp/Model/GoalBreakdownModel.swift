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
    
    func create(breakdown: String, parentGoal: Goal) {
        let newGoalBreakdown = GoalBreakdown(context: context)
        do {
            newGoalBreakdown.id = UUID()
            newGoalBreakdown.breakdown = breakdown
            newGoalBreakdown.parentGoal = parentGoal
            
            try context.save()
        } catch {
            print("Error saving data \(error)")
        }
    }
    
    func retrieve() -> [GoalBreakdown]? {
        let request: NSFetchRequest<GoalBreakdown> = GoalBreakdown.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error retrieving data \(error)")
        }
        return nil
    }
}
