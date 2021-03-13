//
//  AllChannelPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

class AllChannelsPresenter: AllChannelsPresenterProtocol {
    private let view: AllChannelsViewProtocol
    private let service: AllChannelsServiceProtocol
    
    required init(view: AllChannelsViewProtocol, service: AllChannelsServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func showChannels() {
        view.setChannels(channels: service.getAllChannels())
    }
}
