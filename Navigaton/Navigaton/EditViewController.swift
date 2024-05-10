//
//  EditViewController.swift
//  Navigaton
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfmessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var switchOn: UISwitch!
    
    var textWayValu: String = ""
    var isOn: Bool = false
    var textmessage: String = ""
    
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValu
        switchOn.isOn = isOn
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        tfmessage.text = textmessage
    }
    
    @IBAction func btnDown(_ sender: UIButton) {
        delegate?.didMessageEditDown(self, message: tfmessage.text!)
        delegate?.didImageOnOffDone(self, isOn: isOn)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func switchOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    
}
