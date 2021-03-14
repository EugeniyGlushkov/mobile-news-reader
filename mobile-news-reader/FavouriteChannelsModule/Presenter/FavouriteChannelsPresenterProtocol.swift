//
//  FavouriteChannelsPresenterProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol FavouriteChannelsPresenterProtocol: AnyObject {
    init(view: FavouriteChannelsViewProtocol, service: FavouriteChannelsServiceProtocol)
    func showChannels()
    func deleteFromFavourites(channel: ChannelTO)
}
