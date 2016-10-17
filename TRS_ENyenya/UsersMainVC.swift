//
//  ViewController.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

class UsersMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, PopMenuVCDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var arrayOfUsers = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - configure view
        self.navigationController?.isNavigationBarHidden = true
        setTableViewBackgroundGradient(tableView: tableView)
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    
    fileprivate func loadData(){
        
        TodoAPI.taskForGETMethod {(arrayOfTodoDictionaries, error) in
            
            guard let arrayOfTodoDictionaries = arrayOfTodoDictionaries as? [[String:AnyObject]] else {
                print("Could not cast JSON as [String:AnyObject]")
                return
            }
            
            for todoDictionary in arrayOfTodoDictionaries {
                
                //create a Todo object
                let todo = TodoItem(todoDictionary: todoDictionary)
                
                if let user = self.checkIfUserAlreadyExistsInArray(todoUserId: todo.userId) {
                    
                    if todo.completed == false {
                        user.arrayOfRemainingTasks.append(todo)
                    
                    } else {
                        user.arrayOfCompletedTasks.append(todo)
                    }
                    
                } else {
                    //create new User as one doesn't already exist in the arrayOfUsers
                    let user = User(userID: todo.userId)
                    
                    if todo.completed == false {
                        user.arrayOfRemainingTasks.append(todo)
                        
                    } else {
                        user.arrayOfCompletedTasks.append(todo)
                    }
                    self.arrayOfUsers.append(user)
                }
            }
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                self.animateTable(tableView: self.tableView)
                
            })
        }
    }
    
    //check if the userId of a Todo object matches a userId in the arrayOfUsers; if there's a match, return that user
    func checkIfUserAlreadyExistsInArray(todoUserId: Int) -> User? {
        
        for user in arrayOfUsers{
            if user.userId == todoUserId {
                return user
            }
        }
        return nil
    }
  
    
    @IBAction func menuBtnTapped(_ sender: UIButton) {
        let popMenuVC = storyboard?.instantiateViewController(withIdentifier: "PopMenuVC") as! PopMenuVC
        popMenuVC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width/2, height: 100)
        popMenuVC.delegate = self
        
        let navController = UINavigationController(rootViewController: popMenuVC)
        navController.modalPresentationStyle = .popover
        
        let popMenu = navController.popoverPresentationController
        popMenu?.delegate = self
        let viewForSource = sender as UIView
        popMenu?.sourceView = viewForSource
        popMenu?.sourceRect = viewForSource.bounds
        present(navController, animated: true
            , completion: nil)
        
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    //MARK: - PopMenuVCDelegate
    func sortArrayDescending() {
        
       self.arrayOfUsers = arrayOfUsers.map({$0}).sorted(by: {$0.arrayOfRemainingTasks.count > $1.arrayOfRemainingTasks.count})
        
        tableView.reloadData()
    }
    
    func sortArrayAscending() {
        
        self.arrayOfUsers = arrayOfUsers.map({$0}).sorted(by: {$0.arrayOfRemainingTasks.count < $1.arrayOfRemainingTasks.count})
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        
        cell.configureCell(user: arrayOfUsers[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            
            let toDosDetailVC = segue.destination as? TodosDetailVC
            
            if let path = sender as? NSIndexPath {
                
                toDosDetailVC!.arrayOfPendingTasks = arrayOfUsers[path.row].arrayOfRemainingTasks
                toDosDetailVC?.arrayOfCompletedTasks = arrayOfUsers[path.row].arrayOfCompletedTasks
            }
        }
    }
    
}

