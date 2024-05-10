//
//  ViewController.swift
//  TabBarEx
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewC01: UIViewController {

    @IBOutlet weak var lblresult: UILabel!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblresult.text = ""
    }
            
    @IBAction func btnplus(_ sender: UIButton) {
            num += 1
        lblresult.text = String(num)
    }
    

}

