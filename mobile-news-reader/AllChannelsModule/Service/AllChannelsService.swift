//
//  AllChannelsService.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation
import CoreData

class AllChannelsService: AllChannelsServiceProtocol {
    private let repository: ChannelDaoProtocol
    
    required init(repository: ChannelDaoProtocol) {
        self.repository = repository
    }
    
    func getAllChannels() -> [ChannelTO] {
        //TODO: - delete
        //repository.add(channel: ChannelTO(id: "1", name: "first", favourite: false))
        //repository.remove(byId: "1", byName: "first")
        //repository.update(channel: ChannelTO(id: "1", name: "first", favourite: true))
        
        return repository.getAll()
    }
}
