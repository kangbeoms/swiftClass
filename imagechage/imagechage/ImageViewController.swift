//
//  ViewController.swift
//  imagechage
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIView!
    
    @IBOutlet var btnResize: UIView!
    var isZoom = false //이미지 확대여부
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

  

    
    @IBAction func btnSize(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat?
        var newHight: CGFloat?
        
        if isZoom{
            newWidth = imgView.frame.width % scale
            newWidth = imgView.frame.height % scale
            btnResize.setTitle("Image 확대", for: .normal)
        }else{
            newWidth = imgView.frame.width * scale
            newWidth = imgView.frame.height * scale
            btnResize.setTitle("Image 축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth!, height: newHight)
        isZoom = !isZoom
    }
 
}

