//
//  ViewController.swift
//  Quize_02
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {
    // 안내 텍스트
    @IBOutlet weak var checkText: UILabel!
    //입력받는 변수
    @IBOutlet weak var tfnum1: UITextField!
    @IBOutlet weak var tfnum2: UITextField!
    
    
    // 계산 결과 텍스트 필드 변수
    @IBOutlet weak var addRe: UITextField!
    @IBOutlet weak var subRe: UITextField!
    @IBOutlet weak var mulRe: UITextField!
    @IBOutlet weak var divRe: UITextField!
    @IBOutlet weak var divQ: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 텍스트 필드 readonly
        addRe.isUserInteractionEnabled = false
        subRe.isUserInteractionEnabled = false
        mulRe.isUserInteractionEnabled = false
        divRe.isUserInteractionEnabled = false
        divQ.isUserInteractionEnabled = false
       
    }

    @IBAction func btnAct(_ sender: Any) {
        
        // tfnum1.text?.count == 0 도 가능
        if (tfnum1.text!.isEmpty || tfnum2.text!.isEmpty) {
            tfnum1.becomeFirstResponder() // 커서 위치 조정하기
            checkText.text = "숫자를 전부 입력하세요!"
        }else {
            
            let add: Int
            let sub: Int
            let mul: Int
            let div: Int
            
            let num1: Int  = Int(tfnum1.text!)!
            let num2: Int  = Int(tfnum2.text!)!
            
            add = Int(num1 + num2)
            sub = Int(num1 - num2)
            mul = Int(num1 * num2)
            div = Int(num1 / num2)
            addRe.text = String(add)
            subRe.text = String(sub)
            mulRe.text = String(mul)
            divRe.text = String(div)
            if(tfnum2.text == "0") {
                divQ.text = "계산불가"
                divRe.text = "계산불가"
            }
            divQ.text = String(num1 % num2)
            divRe.text = String(num1 / num2)
            
            checkText.text = "계산되었다"
        }
    }
    
    @IBAction func btnclear(_ sender: Any) {
        tfnum1.text = ""
        tfnum2.text = ""
        addRe.text = ""
        subRe.text = ""
        mulRe.text = ""
        divRe.text = ""
        divQ.text = ""
        divRe.text = ""
        
        checkText.text = "숫자를 확인하세요!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

