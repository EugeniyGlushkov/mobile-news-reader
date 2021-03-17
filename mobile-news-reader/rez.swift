//
//  rez.swift
//  mobile-news-reader
//
//  Created by evgen on 17.03.2021.
//

import Foundation
import CoreData

/*
extension EntityNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityNew> {
        return NSFetchRequest<EntityNew>(entityName: "EntityNew")
    }

    @NSManaged public var author: String?
    @NSManaged public var content: String?
    @NSManaged public var description_new: String?
    @NSManaged public var image_url: URL?
    @NSManaged public var published: Date?
    @NSManaged public var source_id: String?
    @NSManaged public var source_name: String?
    @NSManaged public var title: String?
    @NSManaged public var url: URL?

}

extension EntityNew : Identifiable {

}

-----------------------


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


--------------------

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var favourite: Bool
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Channel : Identifiable {

}

-----------------


import Foundation
import CoreData

@objc(Channel)
public class Channel: NSManagedObject {
    convenience init(id: String, name: String, favourite: Bool, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Channel", in: context) {
            self.init(entity: ent, insertInto: context)
            self.id = id
            self.name = name
            self.favourite = favourite
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
}
*/
