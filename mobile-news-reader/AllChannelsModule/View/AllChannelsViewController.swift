//
//  AllChannelsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

class AllChannelsViewController: UIViewController {
    var presenter: AllChannelsPresenterProtocol!
    
    var channels = Array<ChannelTO>()
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.showChannels()
        super.viewDidAppear(animated)
    }
}

extension AllChannelsViewController: AllChannelsViewProtocol {
    func setPresenter(presenter: AllChannelsPresenter) {
        self.presenter = presenter
    }
    
    func setChannels(channels: [ChannelTO]) {
        self.channels = channels
        tableView.reloadData()
    }
}

extension AllChannelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = channels[indexPath.row].name
        return cell
    }
    
    
}
