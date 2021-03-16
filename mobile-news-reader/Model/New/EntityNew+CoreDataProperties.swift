//
//  EntityNew+CoreDataProperties.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//
//

import Foundation
import CoreData


extension EntityNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityNew> {
        return NSFetchRequest<EntityNew>(entityName: "EntityNew")
    }

    @NSManaged public var author: String?
    @NSManaged public var content: String?
    @NSManaged public var image_url: URL?
    @NSManaged public var description_new: String?
    @NSManaged public var published: Date?
    @NSManaged public var source_id: String?
    @NSManaged public var source_name: String?
    @NSManaged public var title: String?
    @NSManaged public var url: URL?

}
