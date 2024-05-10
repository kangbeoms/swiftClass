//
//  ViewController.swift
//  switchEx
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var swichState: UISwitch!
    @IBOutlet weak var switch2State: UISwitch!
    @IBOutlet weak var lightOn: UILabel!
    @IBOutlet weak var lightSize: UILabel!
    var light = true
    var sizeOn = false
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        imageV.image = imgOn
    }
    
    @IBAction func switchSize(_ sender: UISwitch) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat?
        var newHight: CGFloat?
        if sizeOn{
            newWidth = imageV.frame.width * scale
            newHight = imageV.frame.height * scale
        
            lightSize.text = "전구 축소"
            sizeOn = false
        }else{
            newWidth = imageV.frame.width / scale
            newHight = imageV.frame.height / scale
            lightSize.text = "전구 확대"
            sizeOn = true
        }
        imageV.frame.size = CGSize(width: newWidth!, height: newHight!)
    }
    @IBAction func switchLight(_ sender: UISwitch) {
        switch light{
        case true:
            imageV.image = imgOff
            light = false
            
        case false:
            imageV.image = imgOn
            light = true
        }
    }
}
