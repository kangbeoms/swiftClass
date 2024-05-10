//
//  ViewController.swift
//  ButtonName2
//
//  Created by TJ on 2024/04/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelSmile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func btnAdd(_ sender: Any) {
        let smile: String
        smile = "😏"
        labelSmile.text! += smile
        
        
    }
    
    @IBAction func btnMad(_ sender: Any) {
        let mad: String
        mad = "😡"
      
        labelSmile.text! += mad
        
        
    }
    
    @IBAction func btnSad(_ sender: Any) {
        let sad: String
        sad = "😥"
        labelSmile.text! += sad
    }
}

