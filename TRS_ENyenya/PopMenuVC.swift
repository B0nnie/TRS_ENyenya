//
//  PopMenuVC.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/16/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

protocol PopMenuVCDelegate: class {
    func sortArrayAscending()
    func sortArrayDescending()
}

class PopMenuVC: UIViewController {
    
    weak var delegate : PopMenuVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sortAscendingBtnTapped(_ sender: UIButton) {
        delegate?.sortArrayAscending()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sortDescendingBtnTapped(_ sender: AnyObject) {
        delegate?.sortArrayDescending()
        self.dismiss(animated: true, completion: nil)
    }
    
}
