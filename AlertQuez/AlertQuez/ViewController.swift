//
//  ViewController.swift
//  AlertQuez
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let lightOn = "lamp_on"
    let lightOff = "lamp_off"
    let lightRemove = "lamp_remove"
    
    var lightState = true
    var removeState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: lightOn)
        
    }
    @IBAction func On(_ sender: UIButton) {
        lightState ? errorMessage() : GoOff()
    }
    @IBAction func Off(_ sender: UIButton) {
        lightState ? GoOff() : errorMessage()
    }
    @IBAction func Remove(_ sender: UIButton) {
        GoRemove()
    }
    
    
  // ----- Function ------
    
    func GoOff() {
        let testAlert = UIAlertController(title: lightState ? "램프 끄기" : "램프 켜기", message: lightState ? "램프를 끄시갰습니까?" : "램프를 켜시겠습니까?" , preferredStyle: .alert)
        
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "네", style: .default , handler: { [self]ACTION in
            imageView.image =     lightState ?   UIImage(named: lightOff)
            :   UIImage(named: lightOn)
            
            lightState  = !lightState
        })
        
        let actionDefault2 = UIAlertAction(title: "아니오", style: .default)
        
        //UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDefault2)
        // Alert 는 present 가 있어야 화면에 뜬다
        present(testAlert, animated: true)
    }
    
    func errorMessage() {
        let testAlert = UIAlertController(title: "경고", message: lightState ? "현재 ON 상태입니다." : "현재 OFF 상태입니다,", preferredStyle: .alert)
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default)
       
        
        //UIAlertController 에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        // Alert 는 present 가 있어야 화면에 뜬다
        present(testAlert, animated: true)
    }
    
    func GoRemove() {
        let testAlert = UIAlertController(title: "램프제거", message: "램프를 제거할까요?" , preferredStyle: .alert )
        
        let actionDefault = UIAlertAction(title: "아니오 끕니다.", style: .default , handler: {[self]ACTION in
            imageView.image = UIImage(named: lightOff)
            
            lightState = false
        })
        
        let actionDefault2 = UIAlertAction(title: "아니오 켭니다.", style: .default ,handler: {[self]ACTION in
            imageView.image = UIImage(named: lightOn)
            lightState = true
        })
        
        let actionDefault3 = UIAlertAction(title: "네 제거합니다.", style: .default ,handler: {ACTION in
            self.imageView.image = UIImage(named: self.lightRemove)
        })
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDefault2)
        testAlert.addAction(actionDefault3)
        
        present(testAlert, animated: true)
 
    }
}

