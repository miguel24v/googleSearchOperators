//
//  CustomCellTableViewCell.swift
//  Advanced-Search
//
//  Created by Miguel Valdez on 5/19/16.
//  Copyright © 2016 MexPol. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var OpeLabel: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
