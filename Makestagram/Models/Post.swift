//
//  Post.swift
//  Makestagram
//
//  Created by Marta on 29/06/2017.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post {
    var likeCount: Int
    var key: String?
    var isLiked = false
    let imgURL: String
    let imgHeight: CGFloat
    let creationDate: Date
    let poster: User
    
    var dictValue: [String: Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        let userDict = ["uid": poster.uid, "username": poster.username]
        
        return ["img_url": imgURL, "img_height": imgHeight, "created_at": createdAgo, "like_count": likeCount, "poster": userDict]
    }
    
    init(imgURL: String, imgHeight: CGFloat) {
        self.imgURL = imgURL
        self.imgHeight = imgHeight
        self.creationDate = Date()
        self.likeCount = 0
        self.poster = User.current
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let imgURL = dict["img_url"] as? String, let imgHeight = dict["img_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval, let likeCount = dict["like_count"] as? Int,
            let userDict = dict["poster"] as? [String: Any], let uid = userDict["uid"] as? String,
            let username = userDict["username"] as? String else { return nil }
        
        self.key = snapshot.key
        self.imgURL = imgURL
        self.imgHeight = imgHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
        self.likeCount = likeCount
        self.poster = User(uid: uid, username: username)
    }
}
