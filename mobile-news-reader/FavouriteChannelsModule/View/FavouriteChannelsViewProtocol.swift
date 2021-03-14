//
//  FavouriteChannelsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol FavouriteChannelsViewProtocol: AnyObject {
    func update(channels: [ChannelTO])
    func setPresenter(presenter: FavouriteChannelsPresenterProtocol)
}
