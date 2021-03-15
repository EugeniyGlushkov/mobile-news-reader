//
//  CoreDataHelper.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    let stack = CoreDataStack(modelName: "mobile-news-reader")!
    var context:NSManagedObjectContext
    
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>? {
        didSet {
            executeSearch()
        }
    }
    
    init() {
        context = stack.context
    }
    
    func executeSearch() {
        if let fc = fetchedResultsController {
            do {
                try fc.performFetch()
            } catch let e as NSError {
                print("Error while trying to perform a search: \n\(e)\n\(fetchedResultsController)")
            }
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
