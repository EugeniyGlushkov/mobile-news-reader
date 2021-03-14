//
//  ChannelTO.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

struct ChannelTO {
    let id: String
    let name: String
    let favourite: Bool
    
    init(channel: Channel) {
        id = channel.id!
        name = channel.name!
        favourite = channel.favourite
    }
}
