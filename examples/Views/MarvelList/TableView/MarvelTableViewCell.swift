//
//  MarvelTableViewCell.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import UIKit

class MarvelTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
