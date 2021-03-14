//
//  ModuleConfigurator.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

protocol Configurator {
    static func configurateAllChannelsModule(vc: AllChannelsViewProtocol)
}

class ModuleConfigurator: Configurator {
    static func configurateAllChannelsModule(vc: AllChannelsViewProtocol) {
        let repository = ChannelDao.getInstance()
        let service = AllChannelsService(repository: repository)
        let webService = ChannelsNetService()
        let presenter = AllChannelsPresenter(view: vc, service: service, netService: webService)
        vc.setPresenter(presenter: presenter)
    }
    
    static func configurateFavouriteChannelsModule(vc: FavouriteChannelsViewProtocol) {
        let repository = ChannelDao.getInstance()
        let service = FavouriteChannelsService(repository: repository)
        let presenter = FavouriteChannelsPresenter(view: vc, service: service)
        vc.setPresenter(presenter: presenter)
    }
}
