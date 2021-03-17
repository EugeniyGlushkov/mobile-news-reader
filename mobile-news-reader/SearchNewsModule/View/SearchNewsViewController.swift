//
//  SearchNewsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import UIKit

class SearchNewsViewController: UIViewController {
    var presenter: SearchNewsPresenterProtocol!
    
    var news = Array<NewTO>()
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Celll")
        /*tableView.dataSource = self
        tableView.delegate = self*/
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        news = Array<NewTO>()
        tableView.reloadData()
        super.viewDidDisappear(animated)
    }
}

extension SearchNewsViewController: SearchNewsViewProtocol {
    func update(news: [NewTO]) {
        self.news = news
        tableView.reloadData()
    }
    
    func setPresenter(presenter: SearchNewsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        //TODO: - needed implemented
    }
}

extension SearchNewsViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celll")
        let text =
        cell?.textLabel?.text =  (news[indexPath.row].author ?? "No author") + "::::" + (news[indexPath.row].title ?? "No title")
        print(cell?.textLabel?.text!)
        return cell!
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        
        guard !text.isEmpty else {
            return
        }
        
        presenter.searchNews(forStrinf: text)
    }
}
