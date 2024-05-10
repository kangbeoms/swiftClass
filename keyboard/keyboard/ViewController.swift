//
//  ViewController.swift
//  keyboard
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setKeyboard()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func setKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillApper(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisApper(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillApper(_ sender: NotificationCenter){
        view.frame.origin.y = -170
    }
    @objc func keyboardWillDisApper(_ sender: NotificationCenter){
        view.frame.origin.y = 0
    }
}

