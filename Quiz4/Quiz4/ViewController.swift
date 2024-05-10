//
//  ViewController.swift
//  Quiz4
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfnum1: UITextField!
    @IBOutlet weak var tfnum2: UITextField!
    @IBOutlet weak var lblresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnAct(_ sender: Any) {
        
                let num1: Int = Int(tfnum1.text!) ?? 0
                let num2: Int = Int(tfnum2.text!) ?? 0
                var sum: Int = 0
        
//                var tupleNum = (Int(tfnum1.text!) ?? 0, Int(tfnum2.text!) ?? 0)
//
//                if tupleNum.0 > tupleNum.1 {
//                    tupleNum = (tupleNum.1, tupleNum.0)
//                }
//
//                for i in tupleNum.0...tupleNum.1 {
//                    sum += i
//                }
        
            if(num2 == 0 && num1 == 0)  {
                lblresult.text = "적어도 하나는 0보다 큰 수를 입력하세요."
            } else {
                if (num1 == num2) {
                    lblresult.text = "서로다른 숫자를 입력해주세요."
                } else {
                    if (num2 < num1) {
                        var sum: Int = 0
                        for i in num2...num1 {
                            sum += i
                            lblresult.text = "합계\(sum)"
                        }
                    }else {
                        for i in num1...num2 {
                            sum += i
                            lblresult.text = "합계\(sum)"
                        }
                    }
                }
        }
    }
}

