//
//  DataService.swift
//  burgydev-showcase
//
//  Created by Yong Jae Kim on 2015. 12. 1..
//  Copyright © 2015년 Yong Jae Kim. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://burgydev-showcase.firebaseio.com"
class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_POSTS = Firebase(url: "\(URL_BASE)/post")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_POSTS: Firebase {
        return _REF_POSTS
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}
