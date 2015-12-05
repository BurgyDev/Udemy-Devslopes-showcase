//
//  PostCell.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 12. 3..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import UIKit
import Alamofire

class PostCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var showcaseImage: UIImageView!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var likesLabel: UILabel!
    
    var post: Post!
    var request: Request?
    
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
    
    func configureCell(post: Post, image: UIImage?) {
        
        self.post = post
        
        self.descriptionText.text = post.postDescription
        self.likesLabel.text = "\(post.likes)"
        
        if post.imageUrl != nil {
            if image != nil {
                self.showcaseImage.image = image
            } else {
                request = Alamofire.request(.GET, post.imageUrl!).validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) -> Void in
                    if err == nil {
                        let img = UIImage(data: data!)!
                        self.showcaseImage.image = img
                        FeedVC.imageCache.setObject(img, forKey: self.post.imageUrl!)
                    }
                })
            }
        } else {
            self.showcaseImage.hidden = true
        }
    }

}
