//
//  ImageViewController.swift
//  NavigationQuiz
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var lightState: UISwitch!
    @IBOutlet weak var colorState: UISwitch!
    @IBOutlet weak var lbllight: UILabel!
    @IBOutlet weak var lblcolor: UILabel!
    var isOn = true
    var isRed = false
    
    var 프로토콜: imageSwipe?
    override func viewDidLoad() {
        super.viewDidLoad()
        lightState.isOn = isOn
        colorState.isOn = isRed
    }
    
    @IBAction func switchOn(_ sender: UISwitch) {
                isOn = !isOn
        lbllight.text = isOn ? "On" : "Off"
    }
    
    @IBAction func switchRed(_ sender: UISwitch) {
        isRed = !isRed
        lblcolor.text = isRed ? "Red" : "Yellow"
    }
    
    @IBAction func btnGoResult(_ sender: UIButton) {
        if !isOn{
            프로토콜?.didImageRed(self,isRed: isRed, isOn: isOn)
            pop()
        }else{
            if isRed && isOn{
                프로토콜?.didImageRed(self,isRed: isRed, isOn: isOn)
                pop()
            }else{
                프로토콜?.didImageRed(self, isRed: isRed , isOn: isOn)
                pop()
            }
        }
    }
    func pop(){
        navigationController?.popViewController(animated: true)
    }
}
