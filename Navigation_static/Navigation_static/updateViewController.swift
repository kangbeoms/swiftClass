//
//  updateViewController.swift
//  Navigation_static
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class updateViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var switchState: UISwitch!
    @IBOutlet weak var lblwhatState: UILabel!
        var label = ""
        var whatState = true
    //var 메세지: SavedData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfMessage.text = SavedData.message
        whatState = SavedData.isOn
        lblwhatState.text = label
        
    }
    
    @IBAction func lightSwitch(_ sender: UISwitch) {
        whatState = !whatState
        lblwhatState.text = whatState ? "on" : "off"
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        SavedData.message = tfMessage.text!
        SavedData.isOn = whatState
        navigationController?.popViewController(animated: true)
    }
    

}
