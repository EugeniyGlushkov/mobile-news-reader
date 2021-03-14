//
//  AllChannelsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

protocol AllChannelsViewProtocol: AnyObject {
    func update(channels: [ChannelTO])
    func setPresenter(presenter: AllChannelsPresenterProtocol)
    func failure(error: Error)
}
