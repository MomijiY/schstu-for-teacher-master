//
//  Post.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/10/11.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import Foundation
import Firebase

struct Post {
    let content: String
    let postID: String
    let senderID: String
    let createdAt: Timestamp
    let updatedAt: Timestamp
    
    init(data: [String: Any]) {
        content = data["content"] as! String
        postID = data["postID"] as! String
        senderID = data["senderID"] as! String
        createdAt = data["createdAt"] as! Timestamp
        updatedAt = data["updatedAt"] as! Timestamp
    }
}
