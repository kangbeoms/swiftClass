//
//  ViewController.swift
//  TextName
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var ftName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Welcome!"
        // Do any additional setup after loading the view.
    }

  
    @IBAction func btnInsert(_ sender: Any) {
       
    
        lblTitle.text! += ftName.text!
    }
    
    @IBAction func btnclear(_ sender: Any) {
        lblTitle.text = "Welcome!"
        ftName.text = ""
        self.view.endEditing(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

