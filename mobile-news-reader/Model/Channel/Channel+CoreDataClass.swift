//
//  Channel+CoreDataClass.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//
//

import Foundation
import CoreData

@objc(Channel)
public class Channel: NSManagedObject {
    convenience init(id: String, name: String, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Channel", in: context) {
            self.init(entity: ent, insertInto: context)
            self.id = id
            self.name = name
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
}
