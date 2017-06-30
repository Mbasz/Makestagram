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
    var key: String?
    let imgURL: String
    let imgHeight: CGFloat
    let creationDate: Date
    
    var dictValue: [String: Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["img_url": imgURL, "img_height": imgHeight, "created_at": createdAgo]
    }
    
    init(imgURL: String, imgHeight: CGFloat) {
        self.imgURL = imgURL
        self.imgHeight = imgHeight
        self.creationDate = Date()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any], let imgURL = dict["image_url"] as? String, let imgHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval else { return nil }
        
        self.key = snapshot.key
        self.imgURL = imgURL
        self.imgHeight = imgHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
}
