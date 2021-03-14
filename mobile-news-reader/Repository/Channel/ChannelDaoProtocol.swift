//
//  ChannelDaoProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol ChannelDaoProtocol: AnyObject {
    func getAll() -> [ChannelTO]
}
