//
//  AllChannelsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

class AllChannelsViewController: UIViewController {
    var presenter: AllChannelsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AllChannelsViewController: AllChannelsViewProtocol {
    func setPresenter(presenter: AllChannelsPresenter) {
        self.presenter = presenter
    }
    
    func setChannels(channels: [Channel]) {
        
    }
}
