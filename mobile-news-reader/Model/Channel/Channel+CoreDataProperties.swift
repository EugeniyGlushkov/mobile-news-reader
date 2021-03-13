//
//  Channel+CoreDataProperties.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var favourite: Bool

}

extension Channel : Identifiable {

}
