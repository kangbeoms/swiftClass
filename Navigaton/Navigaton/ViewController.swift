//
//  ViewController.swift
//  Navigaton
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfmessage: UITextField!
    @IBOutlet weak var imgview: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var inOn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgview.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            editViewController.textWayValu = "Segue: Use Button"
        }else{
            editViewController.textWayValu = "Segue: Use bar Button"
        }
        
        editViewController.isOn = inOn
        editViewController.textmessage = tfmessage.text!
        // 내 소스에 와서 사용할 수 있게 권한줄 준다
        editViewController.delegate = self
    }

}
    // 프로토콜에서 정의한 내용을 ViewController 에 추가해준다.
extension ViewController: EditDelegate{
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgview.image = imgOn
            self.inOn  = true
        }else{
            imgview.image = imgOff
            self.inOn  = false
        }
    }
    
    func didMessageEditDown(_ controller: EditViewController, message: String) {
        tfmessage.text = message
    }
    
    
}

