//
//  FavouriteChannelsTableViewCell.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import UIKit

class FavouriteChannelsTableViewCell: UITableViewCell {
    var deleteFromFavouritesHandler: (() -> ())?
    
    //MARK: - IBAction
    @IBAction func deleteFromFavouritesButtonTapped(_ sender: Any) {
        guard let handler = deleteFromFavouritesHandler else {
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
