//
//  MaterialView.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 11. 29..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    //test
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
