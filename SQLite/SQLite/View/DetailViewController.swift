//
//  DetailViewController.swift
//  SQLite
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class DetailViewController: UIViewController {
            
    @IBOutlet weak var tfid: UITextField!
    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfdept: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    
    var id = 0
    var name = ""
    var dept = ""
    var phone = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfid.text = String(id)
        tfname.text = name
        tfdept.text = dept
        tfphone.text = phone
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        GoUpdate()
    }
    
    
    
    @IBAction func btndelete(_ sender: UIButton) {
        let studentDB = StudentsDB()
        let getId = Int(tfid.text!)
        let result = studentDB.DeleteDB(id: getId!)
        
        ShowAlert(sendwhere: "삭제", result: result)
    }
    
    
    
    func GoUpdate() {
        let studentDB = StudentsDB()
        let Id    = Int(tfid.text!)
        let Dept  = tfdept.text?.trimmingCharacters(in: .whitespaces)
        let Name  = tfname.text?.trimmingCharacters(in: .whitespaces)
        let Phone = tfphone.text?.trimmingCharacters(in: .whitespaces)
        
        let result = studentDB.UpdateDB(id: Id!, name: Name ?? "", dept: Dept ?? "", phone: Phone ?? "")

        ShowAlert(sendwhere: "수정", result: result)
    }
    
    

    func ShowAlert(sendwhere: String, result: Bool) {
        
        if result{
            let resultAlert = UIAlertController(title: "결과", message: sendwhere == "수정" ?  "수정 되었습니다." : "삭제 되었습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true)
        }else{
            let resultAlert = UIAlertController(title: "에러", message: "문제 발생.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true)
        }
    }
    
    
}
