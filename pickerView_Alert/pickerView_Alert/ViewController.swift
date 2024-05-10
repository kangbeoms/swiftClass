//
//  ViewController.swift
//  pickerView_Alert
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Time_now: UILabel!
    @IBOutlet weak var Time_alarm: UILabel!
    
    var timeSave1: String  =  ""
    
    var showMessage = true
    
    let timeselector: Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeselector, userInfo: nil, repeats: true)
    }

    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        Time_now.text = "현재 시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "a hh:mm"
        let currentTime = formatter.string(from: date as Date)
        
        if currentTime == timeSave1 && showMessage == true{
            let testAlert = UIAlertController(title: "알림", message: "알람 실행", preferredStyle: .alert)
            // UIAlertAction 설정
            let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in self.showMessage = false
                
            })
            let subview = testAlert.view.subviews.first! as UIView
                let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.yellow
            testAlert.addAction(actionDefault)
        
            // Alert 는 present 가 있어야 화면에 뜬다
            present(testAlert, animated: true)
        }
    }
    @IBAction func picker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        Time_alarm.text = "선택 시간 : \(formatter.string(from:  datePickerView.date))"
        formatter.dateFormat = "a hh:mm"
        timeSave1 = formatter.string(from: datePickerView.date)
     
        showMessage = true
    }
    
}

