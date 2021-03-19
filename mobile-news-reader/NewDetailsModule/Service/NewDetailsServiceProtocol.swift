//
// Created by evgen on 19.03.2021.
//

import Foundation

protocol NewDetailsServiceProtocol {
    init(repository: NewDaoProtocol)
    func getNews(forChannel channel: ChannelTO) -> [NewTO]
    func addAll(news: [NewTO])
}
