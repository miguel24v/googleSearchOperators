//
//  MaterialView.swift
//  devslo-social
//
//  Created by Miguel Valdez on 3/29/16.
//  Copyright © 2016 Miguel Valdez. All rights reserved.
//

import UIKit

class MaterialSearchBar: UIView {

    //adding color to view , shadow , color too dark.
    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSizeMake(0.0 , 2.0)
    }
}
