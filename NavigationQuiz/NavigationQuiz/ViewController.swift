//
//  ViewController.swift
//  NavigationQuiz
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imgRed = UIImage(named: "lamp_red.png")
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var ison = true
    var isred = false
    
    var red = ""
    var on = ""
    var off = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.®
        imageView.image = imgOn
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ImageViewController
        controller.isOn = ison
        controller.isRed = isred
        controller.프로토콜 = self
    }
}

extension ViewController: imageSwipe{
    func didImageRed(_ controller: ImageViewController, isRed: Bool, isOn: Bool) {
        if !isOn{
            imageView.image = imgOff
            isred = isRed
            ison = isOn
        }else{
            if isRed{
                imageView.image = imgRed
                isred = isRed
                ison = isOn
            }else{
                imageView.image = imgOn
                ison = true
                isred = isRed
            }
        }
    }
}

