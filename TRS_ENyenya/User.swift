//
//  User.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/16/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import Foundation

class User {
    
    let userId: Int
    var arrayOfRemainingTasks = [TodoItem]()
    var arrayOfCompletedTasks = [TodoItem]()
    
    init(userID: Int){
        userId = userID
    }
    
}
