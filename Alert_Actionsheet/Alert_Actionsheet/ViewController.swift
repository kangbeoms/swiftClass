//
//  ViewController.swift
//  Alert_Actionsheet
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAlert(_ sender: UIButton) {
        //UIAlerController 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called.")
        })
        let actionCencel = UIAlertAction(title: "Action Cancel", style: .cancel)
        
        
        //UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCencel)
        
        // Alert 는 present 가 있어야 화면에 뜬다
        present(testAlert, animated: true)
    }
    
    @IBAction func btnSheet(_ sender: UIButton) {
        //UIAlerController 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called.")
        })
        let actionCencel = UIAlertAction(title: "Action Cancel", style: .cancel)
        
        
        //UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCencel)
        
        // Alert 는 present 가 있어야 화면에 뜬다
        present(testAlert, animated: true)
    }
    
    
}

