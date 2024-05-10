//
//  ViewController.swift
//  PinchGesture
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePinch: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Pinchsetup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.dopinch(_ :)))
        view.addGestureRecognizer(pinch)
    }
    @objc func dopinch(_ pinch: UIPinchGestureRecognizer){
        imagePinch.transform = imagePinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

