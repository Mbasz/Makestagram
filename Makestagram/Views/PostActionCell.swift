//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Marta on 30/06/2017.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class PostActionCell: UITableViewCell {
    
    static let height: CGFloat = 46
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timaAgoLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("like button tapped")
    }
    
}
