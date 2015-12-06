//
//  PostCell.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 12. 3..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var showcaseImage: UIImageView!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var likeImage: UIImageView!
    
    var post: Post!
    var request: Request?
    var likeRef: Firebase!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: "likeTapped:")
        tap.numberOfTapsRequired = 1
        likeImage.addGestureRecognizer(tap)
        likeImage.userInteractionEnabled = true
        
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
        self.likeRef = DataService.ds.REF_USER_CURRENT.childByAppendingPath("likes").childByAppendingPath(post.postKey)
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
                    } else {
                        print(err.debugDescription)
                    }
                })
            }
        } else {
            self.showcaseImage.hidden = true
        }
        
        let likeRef = DataService.ds.REF_USER_CURRENT.childByAppendingPath("likes").childByAppendingPath(post.postKey)
        
        likeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // NSNull is firebase's rule
            if let doesNotExist = snapshot.value as? NSNull {
                // This mean we have not liked this specific post
                self.likeImage.image = UIImage(named: "heart-empty")
            } else {
                self.likeImage.image = UIImage(named: "heart-full")
            }
            
        })
    }
    
    func likeTapped(sender: UITapGestureRecognizer) {
        likeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // NSNull is firebase's rule
            if let doesNotExist = snapshot.value as? NSNull {
                // This mean we have not liked this specific post
                self.likeImage.image = UIImage(named: "heart-empty")
                self.post.adjustLikes(true)
                self.likeRef.setValue(true)
            } else {
                self.likeImage.image = UIImage(named: "heart-full")
                self.post.adjustLikes(false)
                self.likeRef.removeValue()
            }
            
        })
    }

}
