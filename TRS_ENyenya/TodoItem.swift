//
//  TodoItem.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import Foundation

struct TodoItem {
    
    let userId: Int
    let taskId: Int
    let title: String
    let completed: Bool
    
    init (todoDictionary: [String: AnyObject]){
            userId = todoDictionary[TodoAPI.Constants.UserId] as! Int
            taskId = todoDictionary[TodoAPI.Constants.TaskId] as! Int
            title = todoDictionary[TodoAPI.Constants.Title] as! String
            completed = todoDictionary[TodoAPI.Constants.Completed] as! Bool
    }

    
}
