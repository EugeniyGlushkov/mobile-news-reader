//
//  AllChannelPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

class AllChannelsPresenter: AllChannelsPresenterProtocol {
    weak private var view: AllChannelsViewProtocol!
    private let service: AllChannelsServiceProtocol
    private let netService: ChannelsNetServiceProtocol
        
    required init(view: AllChannelsViewProtocol, service: AllChannelsServiceProtocol, netService: ChannelsNetServiceProtocol) {
        self.view = view
        self.service = service
        self.netService = netService
    }
    
    func showChannels() {
        view.update(channels: service.getAllChannels())
        //TODO: - uncomment
        /*
        netService.getChannels { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let sources):
                let channels = ChannelTO.valuesFrom(sources: sources ?? Sources(status: "ok", sources: []))
                self.service.addAll(channels: channels)
                DispatchQueue.main.async {
                    self.view?.update(channels: self.service.getAllChannels())
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.failure(error: error)
                }
            }
        }*/
    }
    
    func addToFavourites(channel: ChannelTO) {
        service.addToFavourites(channel: channel)
    }
}
