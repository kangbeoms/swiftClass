//
//  ViewController.swift
//  Emoji
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblList: UILabel!
    @IBOutlet weak var lblwhatNow: UILabel!
    
    let imoji = ["🤨","🤓","🤩","🥶","😳","😶"]
    var state = 0
    var showList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imoji.count{
                showList += imoji[i]
        }
        lblwhatNow.text = imoji[state]
        lblList.text = String(showList)
    }
    

        
    @IBAction func btnNext(_ sender: Any) {
        state += 1
        if state >= imoji.count {
            state = 0
            lblwhatNow.text = imoji[state]
        }else {
            lblwhatNow.text = imoji[state]
        }
    }
    @IBAction func btnprev(_ sender: Any) {
        if state <= 0 {
            state = imoji.count
            lblwhatNow.text = imoji[state]
        }else{
            state = state - 1
            lblwhatNow.text = imoji[state]
        }
    }
}

