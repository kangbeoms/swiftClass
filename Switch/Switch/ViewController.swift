//
//  ViewController.swift
//  Switch
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblresult: UILabel!
    
    @IBOutlet weak var tfkor: UITextField!
    
    @IBOutlet weak var tfmath: UITextField!
    
    @IBOutlet weak var tfeng: UITextField!
    
    var tot: Double = 0
    var avg: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblresult.text = ""
        
    }


    @IBAction func btnCalc(_ sender: Any) {
        guard let kor = Double(tfkor.text!) else {showMes(); return}
        guard let math = Double(tfmath.text!) else  {showMes(); return}
        guard let eng = Double(tfeng.text!) else {showMes(); return}
        
        if check(kor, math, eng){
            
        }else {
            lblresult.text = "숫자를 확인하세요"
        }
       
        tot = kor + math  + eng / 3
            
            switch tot {
            case 0...49:
                lblresult.text = "가"
                
            case 50...60:
                lblresult.text = "양"
            case 61...70:
                lblresult.text = "미"
            case 71...80:
                lblresult.text = "우"
            case 81...100:
                lblresult.text = "수"
                
            default:
                lblresult.text = "점수를 확인하세요"
                
            }
    
            func showMes(){
            lblresult.text = "점수를 전부 입력하세요."
}
    }
    
    
    func checkInput(_ kor: Double, _ math: Double, _ eng: Double ) -> Bool{
                    
    }
    
    
    
    func check(_ kor: Double, _ math: Double, _ eng: Double ) -> Bool{
        var checkRE: Bool = true
        if(kor > 100 || kor < 0) || eng > 100 || eng < 0 || math > 100 || math < 0{
            checkRE = false
        }
        return checkRE
    }
}

