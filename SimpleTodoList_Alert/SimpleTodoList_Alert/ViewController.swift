//
//  ViewController.swift
//  SimpleTodoList_Alert
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnAlert(_ sender: Any) {
        let addAlert = UIAlertController(title: "Todo  List", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        
        addAlert.addTextField{ACTION in
            ACTION.placeholder = "추가 내용"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .default)
        let okAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            //print (addAlert.textFields![0].text)
            self.lblMessage.text = addAlert.textFields![0].text!
        })
        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)
        
        present(addAlert,animated: true)
    }
    
}

