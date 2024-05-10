//
//  AddViewController.swift
//  SQLite
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfdept: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnInsert(_ sender: UIButton) {
        let studentDB = StudentsDB()
        let name = tfname.text?.trimmingCharacters(in: .whitespaces)
        let dept = tfdept.text?.trimmingCharacters(in: .whitespaces)
        let phone = tfphone.text?.trimmingCharacters(in: .whitespaces)
        
        // 입력을 안하면 "" 로 대체
        let result = studentDB.insertDB(name: name ?? "", dept: dept ?? "", phone: phone ?? "")
        
        // Alert
        if result{
            let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다.", preferredStyle: .alert)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
