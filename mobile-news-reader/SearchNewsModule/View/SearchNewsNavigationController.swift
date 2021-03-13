//
//  SearchNewsNavigationController.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

class SearchNewsNavigationController: UINavigationController {
    //MARK:- IBOutlet
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navBar.topItem?.title = "Search news"
    }
}
