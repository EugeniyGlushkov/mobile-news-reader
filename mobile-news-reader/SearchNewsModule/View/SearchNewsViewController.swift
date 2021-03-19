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
    var imageUrlsToImages: [URL: UIImage] = [:]

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    //MARK: -IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(with: PreviewNewTableViewCell.self)
        tableView.tableFooterView = UIView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        news = []
        searchBar.text = ""
        imageUrlsToImages = [:]
        tableView.reloadData()
        super.viewDidDisappear(animated)
    }
}

extension SearchNewsViewController: SearchNewsViewProtocol {
    func update(news: [NewTO]) {
        self.news = news
        presenter.loadImages(news: news)
        tableView.reloadData()
    }

    func updateImages(imageUrlsToImages: [URL:UIImage]) {
        self.imageUrlsToImages = imageUrlsToImages
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
        let cell = tableView.dequeueReusableCell(with: PreviewNewTableViewCell.self)
        cell.configViews()
        let currentNew = news[indexPath.row]
        cell.titleTextView.text = currentNew.title
        cell.descriptionTextView.text = currentNew.description_new

        if imageUrlsToImages.count > 0 {
            let image = imageUrlsToImages[news[indexPath.row].image_url!]!
            let fittedImage = image.toSquare()!.resizeImage(targetSize: CGSize(width: 346, height: 346))
            cell.view.backgroundColor = UIColor(patternImage: fittedImage)
        }

        return cell
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }

        guard !text.isEmpty else {
            return
        }

        presenter.searchNews(forString: text)
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ? CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()


        return newImage!
    }

    func toSquare() -> UIImage? {
        guard let selfImage = self.cgImage else {
            return nil
        }
        let cutSize = selfImage.width > selfImage.height ? selfImage.height : selfImage.width
        let shiftX = selfImage.width > selfImage.height ? (selfImage.width - cutSize) / 2 : 0
        let shiftY = selfImage.width > selfImage.height ? 0 : (selfImage.height - cutSize) / 2
        let rect = CGRect(x: shiftX, y: shiftY, width: cutSize, height: cutSize)

        guard let cgImage = self.cgImage?.cropping(to: rect) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}