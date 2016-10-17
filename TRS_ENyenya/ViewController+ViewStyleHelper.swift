//
//  ViewController+ViewStyleHelper.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/16/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarToClear(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func setTableViewBackgroundGradient(tableView: UITableView) {
        let background = CAGradientLayer().aquaMarineColor()
        background.frame = tableView.bounds
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(background, at: 0)
        tableView.backgroundView = backgroundView
    }
    
    func animateTable(tableView: UITableView){
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0.0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: delayCounter * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            
            delayCounter += 1.0
        }
    }
    
}
