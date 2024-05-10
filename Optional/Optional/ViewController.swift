//
//  ViewController.swift
//  Optional
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfdata: UITextField!
    
    @IBOutlet weak var lblmessege: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAct(_ sender: UIButton) {
       
        guard let check2 = tfdata.text else {return}
        if check2.count == 0{
            lblmessege.text = "데이터를 확인"
        }else{
            lblmessege.text = check2
        }
        print(">>>>>", check2)
    }
    
}

