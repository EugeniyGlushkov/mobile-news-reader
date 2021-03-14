//
//  ChannelDao.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

class ChannelDao: ChannelDaoProtocol {
    func getAll() -> [ChannelTO] {
        return [ChannelTO(id: "1", name: "First", favourite: true),
                ChannelTO(id: "2", name: "Second", favourite: false),
                ChannelTO(id: "3", name: "Third", favourite: true)]
    }
}
