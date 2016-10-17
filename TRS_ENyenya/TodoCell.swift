//
//  TodoCell.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var lblTodoID: UILabel!
    @IBOutlet weak var lblTodoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(todo: TodoItem){
        lblTodoID.text = String(describing: todo.taskId)
        lblTodoTitle.text = todo.title
    }
    
}
