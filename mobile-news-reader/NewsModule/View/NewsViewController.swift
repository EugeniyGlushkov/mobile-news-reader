//
//  NewsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import UIKit

class NewsViewController: UIViewController {

    private var presenter: NewsPresenterProtocol!
    private var news = Array<NewTO>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showNews()
    }    
}

extension NewsViewController: NewsViewProtocol {
    func update(news: [NewTO]) {
        self.news = news
    }
    
    func setPresenter(presenter: NewsPresenterProtocol) {
        self.presenter = presenter
    }
}
