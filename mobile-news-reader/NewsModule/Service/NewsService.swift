//
//  NewsService.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class NewsService: NewsServiceProtocol {
    
    private let repository: NewDaoProtocol
    
    required init(repository: NewDaoProtocol) {
        self.repository = repository
    }
    
    func getNews(forChannel channel: ChannelTO) -> [NewTO] {
        //TODO: - delete
        let mockNew = NewTO(source_id: "the-verge", source_name: "The Verge", author: "Jay Peters", title: "Microsoft’s Edge browser will match Chrome’s upcoming four-week release cycle", new_description: "descr", url: URL(string: "https://www.theverge.com/2021/3/12/22327832/microsoft-edge-browser-google-chrome-release-cycle")!, image_url: URL(string: "https://cdn.vox-cdn.com/thumbor/h2TNhqf8u7_lV8mmNRHNxi4G-H0=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19713463/acastro_200207_3900_Edge_0001.0.jpg")!, published: ISO8601DateFormatter().date(from: "2021-03-12T19:32:17Z")!, content: "Cont")
        //repository.add(new: mockNew)
        //repository.remove(bySourceId: mockNew.source_id, bySourceName: mockNew.source_name, byAuthor: mockNew.author, byTitle: mockNew.title)
        
        return repository.getAll(byChannel: channel)
    }
    
    func addAll(news: [NewTO]) {
        news.forEach{ new in
            self.repository.add(new: new)
        }
    }
}
