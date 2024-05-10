//
//  ViewController.swift
//  textView
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfinput: UITextField!
    
    @IBOutlet weak var tvlist: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvlist.isEditable = false
    }

    @IBAction func btnserch(_ sender: Any) {
        guard let input = tfinput.text else {return}
        if !input.trimmingCharacters(in: .whitespaces).isEmpty{
            tvlist.text += input + "\n"
        }
      
    }
    
}

