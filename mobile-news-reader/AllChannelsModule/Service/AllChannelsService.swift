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
        return repository.getAll()
    }
    
    func addAll(channels: [ChannelTO]) {
        channels.forEach{ channel in
            repository.add(channel: channel)
        }
    }
    
    func addToFavourites(channel: ChannelTO) {
        var addedChannel = ChannelTO.copyOf(channel: channel)
        addedChannel.favourite = true
        repository.update(channel: addedChannel)
    }
}
