//
//  ViewController.swift
//  quiz5
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfnum1: UITextField!
    
    @IBOutlet weak var tfnum2: UITextField!
    
    @IBOutlet weak var tfresult: UITextField!
    
    @IBOutlet weak var lblstate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGo(_ sender: Any) {
        
        let num1: Int = Int(tfnum1.text!) ?? 0
        let num2: Int = Int(tfnum2.text!) ?? 0
            
        if num1 % 2 != 0 || num2 % 2 != 0{
            lblstate.text = "짝수만 입력해주세요."
        }else{
            tfresult.text = String(num1 + num2)
            lblstate.text = "덧셈 결과"
        }
    }
    
    
    

}

