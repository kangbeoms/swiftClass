//
//  ViewController.swift
//  TextFieldSwitch
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addState: UISwitch!
    @IBOutlet weak var subState: UISwitch!
    @IBOutlet weak var mulState: UISwitch!
    @IBOutlet weak var divState: UISwitch!
    @IBOutlet weak var tfnum1: UITextField!
    @IBOutlet weak var tfnum2: UITextField!
    
    
    @IBOutlet weak var tfadd: UITextField!
    @IBOutlet weak var tfsub: UITextField!
    @IBOutlet weak var tfmul: UITextField!
    @IBOutlet weak var tfdiv: UITextField!
    
    var addstate = true
    var substate = true
    var mulstate = true
    var divstate = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoCalc(_ sender: UIButton)
    {
        let num1:Double = Double(tfnum1.text!) ?? 0
        let num2:Double = Double(tfnum2.text!) ?? 0
        
 
        tfadd.text = addstate ?  String(Int(clac.add.Acttion(num1, num2))) : ""
        tfsub.text = substate ? String(Int(clac.sub.Acttion(num1, num2))) : ""
        tfmul.text = mulstate ? String(Int(clac.mul.Acttion(num1, num2))) : ""
        if clac.div.Acttion(num1, num2) == 0{
            tfdiv.text = "계산불가"
        }else{
            tfdiv.text = divstate ? String(clac.div.Acttion(num1, num2)) : ""
        }
    }
    
    @IBAction func btndelete(_ sender: Any) {
        tfadd.text = ""
        tfsub.text = ""
        tfmul.text = ""
        tfdiv.text = ""
        tfnum1.text = ""
        tfnum2.text = ""
    }
    
    @IBAction func addSwitch(_ sender: UISwitch) {
       addstate =  StateChange(addstate)
                
    }
    @IBAction func subSwitch(_ sender: UISwitch) {
       substate = StateChange(substate)
    }
    
    @IBAction func mulSwitch(_ sender: UISwitch) {
       mulstate = StateChange(mulstate)
    }
    
    @IBAction func divSwitch(_ sender: UISwitch) {
       divstate = StateChange(divstate)
    }
    
    func StateChange(_ change: Bool) -> Bool{
    var change = !change
    return change
        
    }
    enum clac{
        case add
        case sub
        case mul
        case div
       
        func Acttion(_ input1: Double, _ input2: Double) -> Double{
            switch self{
            case.add:
              return input1 + input2
            case.sub:
                return input1 - input2
            case.mul:
                return input1 * input2
            case.div:
                if input1 == 0 && input2 == 0{
                    return 0
                }else{
                   return input1 / input2
                }
            }
        }
    }
    
    
    
}

