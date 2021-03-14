//
//  FavouriteChannelsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

class FavouriteChannelsPresenter: FavouriteChannelsPresenterProtocol {
    weak private var view: FavouriteChannelsViewProtocol!
    private let service: FavouriteChannelsServiceProtocol
    
    required init(view: FavouriteChannelsViewProtocol, service: FavouriteChannelsServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func showChannels() {
        view.update(channels: service.getAllChannels())
    }
    
    func deleteFromFavourites(channel: ChannelTO) {
        service.deleteFromFavourites(channel: channel)
    }
    
    
}
