//
// Created by evgen on 25.03.2021.
//

import Foundation

protocol NewDaoProtocol {
    func add(new: NewTO)
    func remove(bySourceId source_id: String,
                bySourceName source_name: String,
                byAuthor author: String,
                byTitle title: String)
    func get(bySourceId source_id: String,
             bySourceName source_name: String,
             byAuthor author: String,
             byTitle title: String) -> NewTO?
    func getAll(byChannel channel: ChannelTO) -> [NewTO]
}
