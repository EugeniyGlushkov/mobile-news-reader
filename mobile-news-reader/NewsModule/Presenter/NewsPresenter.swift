//
//  NewsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class NewsPresenter: NewsPresenterProtocol {
    weak private var view: NewsViewProtocol!
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
    }    
}
