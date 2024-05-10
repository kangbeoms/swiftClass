//
//  ViewController.swift
//  delegate_01
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfinput: UITextField!
    
    @IBOutlet weak var lblresult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblresult.text = ""
        // Extension 한 내용을 해당 요소에 추가
        tfinput.delegate = self
    }

    @IBAction func btnPress(_ sender: Any) {
        lblresult.text = tfinput.text
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblresult.text = tfinput.text
        return true
    }
}

