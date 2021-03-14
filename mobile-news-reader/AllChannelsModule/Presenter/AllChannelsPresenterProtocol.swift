//
//  AllChannelPresenterProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

protocol AllChannelsPresenterProtocol: AnyObject {
    init(view: AllChannelsViewProtocol, service: AllChannelsServiceProtocol, netService: ChannelsNetServiceProtocol)
    func showChannels()
    
}
