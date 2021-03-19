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
    @IBOutlet weak var detailsNewImage: UIImageView!
        
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewTitle: UITextView!    
    
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showNew()


        // Do any additional setup after loading the view.
    }
}

extension NewDetailsViewController: NewDetailsViewProtocol {
    func setNew(new: NewTO) {
        //detailsNewTitle.text = new.title
        //detailsNewContent.text = new.content
    }

    func setImage(image: UIImage) {

    }

    func setPresenter(presenter: NewDetailsPresenterProtocol) {
        self.presenter = presenter
    }

    func failure(error: Error) {
        //TODO: - realization is needed
    }
}
