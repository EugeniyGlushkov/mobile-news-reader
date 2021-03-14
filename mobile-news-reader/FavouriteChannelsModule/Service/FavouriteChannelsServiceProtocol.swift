//
//  FavouriteChannelsServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol FavouriteChannelsServiceProtocol {
    init(repository: ChannelDaoProtocol)
    func getAllChannels() -> [ChannelTO]
    func deleteFromFavourites(channel: ChannelTO)
}
