//
//  NewDetailsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 19.03.2021.
//
//

import UIKit

class NewDetailsViewController: UIViewController {
    //TODO: - need delete
    let mockCont = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.==============="
    private var presenter: NewDetailsPresenterProtocol!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewImage: UIImageView!
        
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewTitle: UITextView!    
    
    //MARK: - IBOutlet
    @IBOutlet weak var detailsNewContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: - delete
        //scrollView.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
        scrollViewConfig()
        presenter.showNew()


        // Do any additional setup after loading the view.
    }

    func scrollViewConfig() {
        let detailsTitleTextView = UITextView()
        var detailsRect = detailsTitleTextView.frame
        detailsTitleTextView.frame.size.width = scrollView.frame.width
        detailsTitleTextView.text = mockCont + "1"
        detailsTitleTextView.font = UIFont(name: detailsTitleTextView.font!.fontName, size: 23)
        detailsTitleTextView.frame.size.height = detailsTitleTextView.contentSize.height

        detailsRect.origin.y += detailsTitleTextView.frame.height
        let detailsContentTextView = UITextView(frame: detailsRect)
        detailsContentTextView.frame.size.width = scrollView.frame.width
        detailsContentTextView.text = mockCont + "2"
        detailsContentTextView.frame.size.height = detailsContentTextView.contentSize.height

        scrollView.isPagingEnabled = false
        scrollView.contentSize.height = detailsTitleTextView.frame.height + detailsContentTextView.frame.height
        scrollView.addSubview(detailsTitleTextView)
        scrollView.addSubview(detailsContentTextView)
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
