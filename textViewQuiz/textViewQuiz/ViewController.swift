//
//  ViewController.swift
//  textViewQuiz
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvlist: UITextView!
    @IBOutlet weak var tfinput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvlist.isEditable = false
    }

    @IBAction func btnGo(_ sender: UIButton) {
        tvlist.text = ""
        guard let whatNum = Int(tfinput.text!) else {return}
       for i in 1...9{
           tvlist.text += ("\(whatNum) x \(i) = \t \(whatNum*i) \n")
        }
    }
}

