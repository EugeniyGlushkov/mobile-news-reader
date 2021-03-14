//
//  New+CoreDataClass.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//
//

import Foundation
import CoreData

@objc(New)
public class New: NSManagedObject {
    convenience init(source_id: String,
                     source_name: String,
                     author: String,
                     title: String,
                     new_description: String,
                     url: URL,
                     image_url: URL,
                     published: Date,
                     content: String,
                     context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "New", in: context) {
            self.init(entity: ent, insertInto: context)
            self.source_id = source_id
            self.source_name = source_name
            self.author = author
            self.title = title
            self.new_description = new_description
            self.url = url
            self.image_url = image_url
            self.published = published
            self.content = content
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
}
