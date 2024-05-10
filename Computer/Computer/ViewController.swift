//
//  ViewController.swift
//  Computer
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {
    //인터페이스 빌더
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    @IBOutlet weak var tfbag: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOk(_ sender: UIButton) {
        let name: String
        let size: Int
        let weight: Double
        let bag: Bool
        let color: Character

        name = "맥북프로"
        size = 16
        weight = 2.56
        bag = false
        color = "백"
        
        tfName.text = name
        tfSize.text = String(size)
        tfWeight.text = String(weight)
        tfColor.text = String(color)
        tfbag.text = String(bag)
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text = ""
        tfName.text?.removeAll()
    }
    
}

