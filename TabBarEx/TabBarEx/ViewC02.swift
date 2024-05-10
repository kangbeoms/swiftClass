//
//  ViewC02.swift
//  TabBarEx
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewC02: UIViewController {

    @IBOutlet weak var lblnum: UILabel!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
            
        lblnum.text = ""
    }
    
    @IBAction func btnup(_ sender: UIButton) {
        num += 1
        lblnum.text = String(num)
    }
  

}
