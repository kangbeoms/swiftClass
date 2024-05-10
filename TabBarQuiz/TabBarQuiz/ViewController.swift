//
//  ViewController.swift
//  TabBarQuiz
//
//  Created by TJ on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnPage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

