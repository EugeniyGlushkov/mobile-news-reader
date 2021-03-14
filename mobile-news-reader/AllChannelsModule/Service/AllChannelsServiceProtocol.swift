//
//  AllChannelsServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation

protocol AllChannelsServiceProtocol: AnyObject {
    init(repository: ChannelDaoProtocol)
    func getAllChannels() -> [ChannelTO]
}
