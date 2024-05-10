//
//  ViewC03.swift
//  TabBarEx
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewC03: UIViewController {

    @IBOutlet weak var lblnum: UILabel!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lblnum.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btndown(_ sender: UIButton) {
        num -= 1
        lblnum.text = String(num)
    }
    

}
