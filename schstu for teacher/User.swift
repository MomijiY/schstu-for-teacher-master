//
//  User.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/10/11.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import Foundation
import Firebase

struct AppUser {
    let userID: String
    let userName: String
    
    init(data: [String: Any]) {
        userID = data["userID"] as! String
        userName = data["userName"] as! String
    }
}
