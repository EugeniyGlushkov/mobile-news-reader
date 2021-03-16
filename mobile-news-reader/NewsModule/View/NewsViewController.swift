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
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.showNews()
        super.viewDidAppear(animated)
    }
}

extension NewsViewController: NewsViewProtocol {
    func update(news: [NewTO]) {
        self.news = news
        tableView.reloadData()
    }
    
    func setPresenter(presenter: NewsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func failure(error: Error) {
        //TODO: - realization is needed
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.news[indexPath.row].author ?? "Jhon Dow" + " " + (self.news[indexPath.row].title ?? "Mock title")
        return cell
    }
}
