//
//  PostCell.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 12. 3..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var showcaseImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // circle shape
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
    }
    
    override func drawRect(rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        showcaseImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
