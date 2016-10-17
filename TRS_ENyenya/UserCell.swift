//
//  UserCell.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblTasksRemaining: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }    
    
    func configureCell(user: User){
        lblUserId.text = String(describing: user.userId)
       
        lblTasksRemaining.text = String(describing: user.arrayOfRemainingTasks.count)
    }

}
