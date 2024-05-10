//
//  ViewController.swift
//  emojitest
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNum: UILabel!
    
    var arrNum  = ["10","20","25","35","40","51","61","71","81","91"]
    var indexState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblNum.text = arrNum[indexState]
    }


    @IBAction func btnIncrease(_ sender: Any) {
        indexState+=1
        if indexState >= arrNum.count{
            lblNum.text = "X"
        }else{
            lblNum.text = arrNum[indexState]
        }
    }
}

