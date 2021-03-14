//
//  New+CoreDataProperties.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//
//

import Foundation
import CoreData


extension New {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<New> {
        return NSFetchRequest<New>(entityName: "New")
    }

    @NSManaged public var source_id: String?
    @NSManaged public var source_name: String?
    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var new_description: String?
    @NSManaged public var url: URL?
    @NSManaged public var image_url: URL?
    @NSManaged public var published: Date?
    @NSManaged public var content: String?

}

extension New : Identifiable {

}
