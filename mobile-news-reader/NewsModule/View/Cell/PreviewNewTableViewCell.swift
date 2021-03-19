//
//  PreviewNewTableViewCell.swift
//  mobile-news-reader
//
//  Created by evgen on 17.03.2021.
//

import UIKit

class PreviewNewTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var view: UIView!
    
    //MARK: - IBOutlet
    @IBOutlet weak var titleTextView: UITextView!
    
    //MARK: - IBOutlet
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
