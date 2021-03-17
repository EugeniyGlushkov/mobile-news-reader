//
//  EntityNew+CoreDataClass.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//
//

import Foundation
import CoreData

@objc(EntityNew)
public class EntityNew: NSManagedObject {
    convenience init(author: String,
                     content: String,
                     image_url: URL,
                     description_new: String,
                     published: Date,
                     source_id: String,
                     source_name: String,
                     title: String,
                     url: URL,
                     context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "EntityNew", in: context) {
            self.init(entity: ent, insertInto: context)
            self.author = author
            self.content = content
            self.image_url = image_url
            self.description_new = description_new
            self.published = published
            self.source_id = source_id
            self.source_name = source_name
            self.title = title
            self.url = url
        } else {
            fatalError("Unable to find Entity name!")
        }
    }}
