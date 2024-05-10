//
//  ViewController.swift
//  Navigation_static
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageOn: UIImage = UIImage(named: "lamp_on.png")!
    let imageOff: UIImage = UIImage(named: "lamp_off.png")!
    var message = ""
    var isOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageOn
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! updateViewController

        if segue.identifier == "Go_Button"{
            controller.label = "Segue: Use Button"
        }else{
            controller.label = "Segue: Use bar Button"
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfMessage.text = SavedData.message
        imageView.image = SavedData.isOn ? imageOn : imageOff
    }
    
        
    @IBAction func btnGoUpdate(_ sender: UIButton) {
        guard let text: String = tfMessage.text else {return}
        SavedData.message = text
    }
    
}

