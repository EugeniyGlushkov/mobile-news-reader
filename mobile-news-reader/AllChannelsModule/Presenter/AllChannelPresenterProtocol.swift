//
//  AllChannelPresenterProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

protocol AllChannelPresenterProtocol: AnyObject {
    init(view: AllChannelsViewProtocol, service: AllChannelsServiceProtocol)
    func showChannels()
}
