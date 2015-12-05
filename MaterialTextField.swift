//
//  MaterialTextField.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 11. 30..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 2.0
        self.layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
    }
    
    //For Placeholder
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
    
    //For editable text
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }

}
