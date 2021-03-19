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
    var imageUrlsToImages: [URL: UIImage] = [:]
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(with: PreviewNewTableViewCell.self)
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
        self.presenter.loadImages(news: news)
        tableView.reloadData()
    }

    func updateImages() {
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
        let cell = tableView.dequeueReusableCell(with: PreviewNewTableViewCell.self)
        cell.configViews()
        let currentNew = news[indexPath.row]
        cell.titleTextView.text = currentNew.title
        cell.descriptionTextView.text = currentNew.description_new

        if imageUrlsToImages.count > 0 && imageUrlsToImages.keys.contains(news[indexPath.row].image_url!) {
            let image = imageUrlsToImages[news[indexPath.row].image_url!]!
            let fittedImage = image.toSquare()!.resizeImage(targetSize: CGSize(width: 346, height: 346))
            cell.view.backgroundColor = UIColor(patternImage: fittedImage)
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newDetailsVC = ModuleConfigurator.createNewDescriptionModule(new: news[indexPath.row])
        navigationController?.pushViewController(newDetailsVC, animated: true)
    }
}
