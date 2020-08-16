//
//  JourneyModel.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import CoreData

struct JourneyModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func create(title: String, desc: String, date: Date, image: Data?) -> Journey {
        let newJourney = Journey(context: context)
        do {
            newJourney.id = UUID()
            newJourney.title = title
            newJourney.date = date
            newJourney.desc = desc
            if let img = image {
                newJourney.image = img
            }
            try context.save()
        } catch {
            print("Error saving data \(error)")
        }
        return newJourney
    }
    
    func retrieve() -> [Journey]? {
        let request: NSFetchRequest<Journey> = Journey.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error retrieving data\(error)")
        }
        return nil
    }
}
