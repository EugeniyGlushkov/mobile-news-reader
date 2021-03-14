//
//  FavouriteChannelsService.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

class FavouriteChannelsService: FavouriteChannelsServiceProtocol {
    private let repository: ChannelDaoProtocol
    
    required init(repository: ChannelDaoProtocol) {
        self.repository = repository
    }
    
    func getAllChannels() -> [ChannelTO] {
        repository.getFavourites()
    }
    
    func deleteFromFavourites(channel: ChannelTO) {
        var deletedChannel = ChannelTO.copyOf(channel: channel)
        deletedChannel.favourite = false
        repository.update(channel: deletedChannel)
    }
    
    
}
