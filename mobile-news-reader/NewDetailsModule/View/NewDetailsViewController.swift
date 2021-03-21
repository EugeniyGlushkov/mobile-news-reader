//
//  NewDetailsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 19.03.2021.
//
//

import UIKit

class NewDetailsViewController: UIViewController {
    private var presenter: NewDetailsPresenterProtocol!

    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewTitle: UITextView!    
    
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showNew()
    }

    func scrollViewConfig(new: NewTO) {
        var detailsRect = imageView.frame

        detailsRect.origin.y += imageView.frame.height
        let detailsTitleTextView = UITextView(frame: detailsRect)
        detailsTitleTextView.text = new.title
        detailsTitleTextView.font = UIFont(name: detailsTitleTextView.font!.fontName, size: 25)
        detailsTitleTextView.frame.size.height = detailsTitleTextView.contentSize.height

        detailsRect.origin.y += detailsTitleTextView.frame.height
        let detailsContentTextView = UITextView(frame: detailsRect)
        detailsContentTextView.frame.size.width = scrollView.frame.width
        detailsContentTextView.isScrollEnabled = false
        detailsContentTextView.text = new.content
        detailsContentTextView.font = UIFont(name: detailsContentTextView.font!.fontName, size: 15)
        detailsContentTextView.frame.size.height = detailsContentTextView.contentSize.height

        scrollView.isPagingEnabled = false
        scrollView.contentSize.height = imageView.frame.height
                + detailsTitleTextView.frame.height
                + detailsContentTextView.frame.height

        scrollView.addSubview(detailsTitleTextView)
        scrollView.addSubview(detailsContentTextView)
    }
}

extension NewDetailsViewController: NewDetailsViewProtocol {
    func setNew(new: NewTO) {
        scrollViewConfig(new: new)
        presenter.loadImage(forUrl: new.image_url!)
    }

    func setImage(image: UIImage) {
        let fittedImage =
                image.resizeImage(targetSize: CGSize(width: imageView.frame.width, height: imageView.frame.height))
        imageView.image = fittedImage
    }

    func setPresenter(presenter: NewDetailsPresenterProtocol) {
        self.presenter = presenter
    }

    func failure(error: Error) {
        //TODO: - realization is needed
    }
}
