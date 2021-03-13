//
//  AllChannelsService.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation
import CoreData

class AllChannelsService: AllChannelsServiceProtocol {
    private var helper = CoreDataHelper()
    func getAllChannels() -> [Channel] {
        return [Channel(id: "1", name: "First", favourite: true, context: helper.context),
                Channel(id: "2", name: "Second", favourite: false, context: helper.context),
                Channel(id: "3", name: "Third", favourite: true, context: helper.context)]
    }
}
