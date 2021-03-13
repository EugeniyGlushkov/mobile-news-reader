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
        let service = AllChannelsService()
        let presenter = AllChannelsPresenter(view: vc, service: service)
        vc.setPresenter(presenter: presenter)
    }
}
