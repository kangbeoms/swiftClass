//
//  ViewController.swift
//  pickerview
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var lblcurrentTime: UILabel!
    
    @IBOutlet weak var lblpickerTime: UILabel!
    
    var timeSave1  =  ""
    var count = 0
    let timeselector: Selector = #selector(DateViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeselector, userInfo: nil, repeats: true)
    }
    
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblcurrentTime.text = "선택 시간 : \(formatter.string(from:  datePickerView.date))"
        
        formatter.dateFormat = "A hh:mm"
        timeSave1 = formatter.string(from: datePickerView.date)
     
        
    }
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblpickerTime.text = "현재 시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "A hh:mm"
        let currentTime = formatter.string(from: date as Date)
            count += 1
        if currentTime == timeSave1{
            view.backgroundColor = count % 2 == 0 ? .red : .blue
        }else{
            view.backgroundColor = .white
        }
        
    }
   
}
