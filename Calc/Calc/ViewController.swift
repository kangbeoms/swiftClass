//
//  ViewController.swift
//  Calc
//
//  Created by TJ on 2024/04/29.
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
    @IBAction func btnaddF(_ sender: Any) {
        let num1 = Int(tfnum1.text!) ?? 0
        let num2 = Int(tfnum2.text!) ?? 0
        
        let calc: Calc = Calc()
        lblresult.text = "1.덧셈 결과는 \(calc.add(숫자1: num1, 숫자2: num2)) 입니다."
    }
    
    @IBAction func btnaddP(_ sender: UIButton) {
        let num1 = Int(tfnum1.text!) ?? 0
        let num2 = Int(tfnum2.text!) ?? 0
        
        var calc = Calc()
        calc.number1 = num1
        calc.number2 = num2
        
        lblresult.text = "2.덧셈 결과는 \(calc.add(숫자1: num1, 숫자2: num2)) 입니다."
    }
    
    @IBAction func btnaddC(_ sender: UIButton) {
        let num1 = Int(tfnum1.text!) ?? 0
        let num2 = Int(tfnum2.text!) ?? 0
        
        var calc: Calc = Calc(number1: num1, number2: num2)
        
        lblresult.text = "3.덧셈 결과는 \(calc.add(숫자1: num1, 숫자2: num2)) 입니다."
        
    }
}

