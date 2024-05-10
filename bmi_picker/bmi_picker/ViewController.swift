//
//  ViewController.swift
//  bmi_picker
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    
    var height: [Int] = []
    var weight: [Int] = []
    var bmi = ""
    var storeH = 160
    var storeW = 60
    
    
    @IBOutlet weak var icon1: UILabel!
    @IBOutlet weak var icon2: UILabel!
    @IBOutlet weak var icon3: UILabel!
    @IBOutlet weak var icon4: UILabel!
    @IBOutlet weak var icon5: UILabel!
    
    
    @IBOutlet weak var lblresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createData()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        // 초기값 세팅
        pickerView.selectRow(60, inComponent: 0, animated: true)
        pickerView.selectRow(40, inComponent: 1, animated: true)
        
        //calcBmi(bmiPoint)
        lblresult.text = ""
        icon1.isHidden = true
        icon2.isHidden = true
        icon3.isHidden = true
        icon4.isHidden = true
        icon5.isHidden = true
        

        
    }

    func CalcGo(_ row: Int){
  var bmiPoint = Double(weight[row]) / ((Double(height[row]) / 100) * 2)

        calcBmi(bmiPoint)

        let bmiFormatted = String(format: "%.1f", bmiPoint)
        lblresult.textColor = UIColor.red
        lblresult.text = "귀하의 bmi 지수는 \(bmiFormatted)이고 \(bmi)입니다."
    }
    
    func createData(){
        for i in 100...200{
            height.append(i)
        }
        for i in 20...200{
            weight.append(i)
        }
    }
    
        func calcBmi(_ bmiPoint: Double){
            switch bmiPoint{
            case 0..<18.5:
                bmi = "저체중"
                icon1.isHidden = false
                icon2.isHidden = true
                icon3.isHidden = true
                icon4.isHidden = true
                icon5.isHidden = true
            case 18.5..<22.9:
                bmi = "정상체중"
                icon1.isHidden = true
                icon2.isHidden = false
                icon3.isHidden = true
                icon4.isHidden = true
                icon5.isHidden = true
            case 22.9..<24.9:
                bmi = "과체중"
                icon1.isHidden = true
                icon2.isHidden = true
                icon3.isHidden = false
                icon4.isHidden = true
                icon5.isHidden = true
            case 24.9..<29.9:
                bmi = "경도비만"
                icon1.isHidden = true
                icon2.isHidden = true
                icon3.isHidden = true
                icon4.isHidden = false
                icon5.isHidden = true
            case 29.9..<Double(Int.max):
                bmi = "비만"
                icon1.isHidden = true
                icon2.isHidden = true
                icon3.isHidden = true
                icon4.isHidden = true
                icon5.isHidden = false
            default:
                bmi = "측정불가"
            }
        
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 101
        }else{
            return 181
        }
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return String(height[row])
        }else{
            return String(weight[row])
        }
    }
    
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> String {
        if component == 0 {
            return String(height[row])
           
        }else{
            return String(weight[row])
           
        }
    }

}
