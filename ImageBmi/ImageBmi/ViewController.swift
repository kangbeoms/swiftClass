//
//  ViewController.swift
//  ImageBmi
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfcm: UITextField!
    @IBOutlet weak var tfkg: UITextField!
    @IBOutlet weak var lblresult: UILabel!
    @IBOutlet weak var lblicon: UILabel!
    
    @IBOutlet weak var icon2: UILabel!
    
    @IBOutlet weak var icon3: UILabel!
    var bmi = ""
    @IBOutlet weak var icon4: UILabel!
    
    @IBOutlet weak var icon5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblresult.text = ""
        lblicon.isHidden = true
        icon2.isHidden = true
        icon3.isHidden = true
        icon4.isHidden = true
        icon5.isHidden = true
    }
    
    @IBAction func btnAct(_ sender: UIButton) {
        guard let cm = Double(tfcm.text!) else {return}
        guard let kg = Double(tfkg.text!) else {return}
        var bmiPoint = kg / ((cm / 100) * 2)
        
        calcBmi(bmiPoint)
        
        let bmiFormatted = String(format: "%.1f", bmiPoint)
        lblresult.textColor = UIColor.red
        lblresult.text = "귀하의 bmi 지수는 \(bmiFormatted)이고 \(bmi)입니다."
        
        
    }
    func calcBmi(_ bmiPoint: Double){
        switch bmiPoint{
        case 0..<18.5:
            bmi = "저체중"
            lblicon.isHidden = false
        case 18.5..<22.9:
            bmi = "정상체중"
            icon2.isHidden = false
        case 22.9..<24.9:
            bmi = "과체중"
            icon3.isHidden = false
        case 24.9..<29.9:
            bmi = "경도비만"
            icon4.isHidden = false
        case 29.9..<Double(Int.max):
            bmi = "비만"
            icon5.isHidden = false
        default:
            bmi = "측정불가"
        }
    }
    
}
