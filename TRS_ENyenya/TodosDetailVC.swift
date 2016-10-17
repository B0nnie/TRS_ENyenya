//
//  TodosTVC.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

class TodosDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfPendingTasks = [TodoItem]()
    var arrayOfCompletedTasks = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - configure view
        setTableViewBackgroundGradient(tableView: tableView)
        setNavigationBarToClear()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayOfPendingTasks.count
        }
        return arrayOfCompletedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        
        if indexPath.section == 0 {
           cell.configureCell(todo: arrayOfPendingTasks[indexPath.row])
        } else {
            cell.configureCell(todo: arrayOfCompletedTasks[indexPath.row])
        }
        
        return cell
        
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
        
        if section == 0 {
            
            cell.lblTitle.text = "Pending"
        } else {
            cell.lblTitle.text = "Completed"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
