//
//  CategoryDetailTableViewCell.swift
//  RingTone3
//
//  Created by Cuong on 7/26/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class CategoryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
