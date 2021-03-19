//
//  SearchNewsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import UIKit

class SearchNewsPresenter: SearchNewsPresenterProtocol {
    weak private var view: SearchNewsViewProtocol!
    private let service: SearchNewsServiceProtocol!
    private let netService: NetServiceProtocol!

    required init(view: SearchNewsViewProtocol, service: SearchNewsServiceProtocol, netService: NetServiceProtocol) {
        self.view = view
        self.service = service
        self.netService = netService
    }

    func searchNews(forString string: String) {
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

    func loadImages(news: [NewTO]) {
        for i in 0..<news.count {
            netService.acyncLoadImage(url: news[i].image_url!) { result, error in

                guard let image = result else {
                    self.view.failure(error: error!)
                    return
                }

                self.view.imageUrlsToImages[news[i].image_url!] = image

                DispatchQueue.main.async {
                    self.view.updateImages()
                }
            }
        }
    }
}
