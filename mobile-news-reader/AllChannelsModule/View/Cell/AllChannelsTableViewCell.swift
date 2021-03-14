//
//  AllChannelsTableViewCell.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import UIKit

class AllChannelsTableViewCell: UITableViewCell {
    var addToFavouritesHandler: (() -> ())?
    
    //MARK: - IBAction
    @IBAction func addToFavouritesButtonTapped(_ sender: Any) {
        guard let handler = addToFavouritesHandler else {
            return
        }
        
        handler()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
