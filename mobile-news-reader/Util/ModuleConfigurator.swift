//
//  ModuleConfigurator.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

protocol Configurator {
    static func configurateAllChannelsModule(vc: AllChannelsViewProtocol)
    static func configurateFavouriteChannelsModule(vc: FavouriteChannelsViewProtocol)
    static func createNewsModule(channel: ChannelTO) -> UIViewController
}

class ModuleConfigurator: Configurator {
    static func configurateAllChannelsModule(vc: AllChannelsViewProtocol) {
        let repository = ChannelDao.getInstance()
        let service = AllChannelsService(repository: repository)
        let webService = NetService()
        let presenter = AllChannelsPresenter(view: vc, service: service, netService: webService)
        vc.setPresenter(presenter: presenter)
    }
    
    static func configurateFavouriteChannelsModule(vc: FavouriteChannelsViewProtocol) {
        let repository = ChannelDao.getInstance()
        let service = FavouriteChannelsService(repository: repository)
        let presenter = FavouriteChannelsPresenter(view: vc, service: service)
        vc.setPresenter(presenter: presenter)
    }
    
    static func createNewsModule(channel: ChannelTO) -> UIViewController {
        let view = NewsViewController()
        let service = NewsService()
        let netService = NetService()
        let presenter = NewsPresenter(view: view, service: service, netService: netService, channel: channel)
        view.setPresenter(presenter: presenter)
        return view
    }
}
