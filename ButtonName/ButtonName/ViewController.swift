//
//  ViewController.swift
//  ButtonName
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblText: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblText.text! = "welcome"
    }


        
    @IBAction func btnName(_ sender: Any) {
        lblText.text! += "강범식"
    }
    
}

