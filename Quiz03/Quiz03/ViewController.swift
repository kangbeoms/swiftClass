//
//  ViewController.swift
//  Quiz03
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfstate: UILabel!
    @IBOutlet weak var tfnum1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
    }

    @IBAction func btnGo(_ sender: UIButton) {
        
        if (tfnum1.text!.isEmpty || tfnum1.text == "0") {
            tfstate.text = "정확한 숫자를 입력해"
        }else {
            var num1: Int = 0
             num1 = Int(tfnum1.text!)!
            
            tfstate.text = num1 % 2 == 0 ?  "입력하신 숫자는 짝수입니다" : "입력하신 숫자는 홀수입니다"
        }
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}

