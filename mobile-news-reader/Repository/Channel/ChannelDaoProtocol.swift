//
//  ChannelDaoProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol ChannelDaoProtocol: AnyObject {
    func add(channel: ChannelTO)
    func remove(byId id: String, byName name: String)
    func update(channel: ChannelTO)
    func get(byId id: String, byName name: String) -> ChannelTO?
    func getAll() -> [ChannelTO]
}
