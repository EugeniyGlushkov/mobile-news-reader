//
//  SearchNewsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class SearchNewsPresenter: SearchNewsPresenterProtocol {
    weak private var view: SearchNewsViewProtocol!
    private let service: SearchNewsServiceProtocol!
    private let netService: NetServiceProtocol!
    
    required init(view: SearchNewsViewProtocol, service: SearchNewsServiceProtocol, netService: NetServiceProtocol) {
        self.view = view
        self.service = service
        self.netService = netService
    }
    
    func searchNews(forStrinf string: String) {
        netService.searchNews(forString: string) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let articles):
                let news = NewTO.valuesFrom(articles: articles ?? Articles(status: "ok", totalResults: 0, articles: []))
                DispatchQueue.main.async {
                    self.view?.update(news: news)
                }
                self.service.addAll(news: news)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
