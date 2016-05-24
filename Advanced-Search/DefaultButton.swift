//
//  DefaultButton.swift
//  FavoritePlace
//
//  Created by Miguel Valdez on 5/13/16.
//  Copyright © 2016 Miguel. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        backgroundColor = UIColor(red: 66.0/255.0, green: 66.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        setTitleColor( UIColor.whiteColor(), forState: .Normal)
        
        //material properties
//        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.3).CGColor
//        layer.shadowOpacity = 1
//        layer.shadowRadius = 1.0
//        layer.shadowOffset = CGSizeMake(0.0 , 2.0)
    }

}
