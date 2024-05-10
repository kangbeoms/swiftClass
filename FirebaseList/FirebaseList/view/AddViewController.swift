//
//  AddViewController.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var tfcode: UITextField!
    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfdept: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    
    var code = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnInsert(_ sender: UIButton) {
        
        if tfcode.text!.isEmpty{
         let resultAlert = UIAlertController(title: "경고", message: "코드는 반드시 입력하세요.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
            
        }else{
            code = tfcode.text!
            let resultAler = UIAlertController(title: "완료", message: "입력 되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
                self.insetAct()
            })
            resultAler.addAction(onAction)
            present(resultAler, animated: true)
            
            
        }
        
    }
   
    func insetAct() {
        
        let name = tfname.text ?? "이름 작성 안한사람"
        let dept = tfdept.text ?? "전공 X"
        let phone = tfphone.text ?? "번호 X"
        
        
        let insertModel = InsertModel()
        _ = insertModel.insertItems(code: code, name: name, dept: dept, phone: phone)
                
    }
}
