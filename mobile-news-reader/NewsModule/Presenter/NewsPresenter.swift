//
//  NewsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class NewsPresenter: NewsPresenterProtocol {
    private var view: NewsViewProtocol!
    private let service: NewsServiceProtocol!
    private let netService: NetServiceProtocol!
    private let channel: ChannelTO
    
    required init(view: NewsViewProtocol, service: NewsServiceProtocol, netService: NetServiceProtocol, channel: ChannelTO) {
        self.view = view
        self.service = service
        self.netService = netService
        self.channel = channel
    }
    
    func showNews() {
        view?.update(news: service.getNews(forChannel: channel))
        
        netService.getNews(forChannel: channel) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let articles):
                let news = NewTO.valuesFrom(articles: articles ?? Articles(status: "ok", totalResults: 0, articles: []))
                self.service.addAll(news: news)
                DispatchQueue.main.async {
                    self.view?.update(news: self.service.getNews(forChannel: self.channel))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
