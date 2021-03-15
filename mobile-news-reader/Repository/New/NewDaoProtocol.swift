//
//  NewDaoProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol NewDaoProtocol {
    func getAll(byChannel channel: ChannelTO) -> [NewTO]
    func add(new: NewTO)
    func get(bySourceId source_id: String, bySourceName source_name: String, byAuthor author: String, byTitle title: String) -> NewTO?
    func remove(bySourceId source_id: String, bySourceName source_name: String, byAuthor author: String, byTitle title: String)
}
