//
//  DetailViewController.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfcode: UITextField!
    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfdept: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfcode.text = Message.code
        tfname.text = Message.name
        tfdept.text = Message.dept
        tfphone.text = Message.phone
        
        tfcode.isUserInteractionEnabled = false
    }
    

    @IBAction func btnUpdate(_ sender: UIButton) {
        let documentId = Message.documentId
        let code = tfcode.text!
        let name = tfname.text ?? ""
        let dept = tfdept.text ?? ""
        let phone = tfphone.text ?? ""
        
        let updateModel = UpdateModel()
        let result = updateModel.updateItems(documentId: documentId, code: code, name: name, dept: dept, phone: phone)
        
        if result == true{
            let resultAler = UIAlertController(title: "완료", message: "수정이 되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
                
                
            })
            resultAler.addAction(onAction)
            present(resultAler, animated: true)
        }else{
           
                let resultAler = UIAlertController(title: "실패", message: "에러 발생.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default)
                resultAler.addAction(onAction)
                present(resultAler, animated: true)
        }
    }

    @IBAction func btnDelete(_ sender: UIButton) {
        let documentId = Message.documentId
        
        let deleteModel = DeleteModel()
        let result = deleteModel.deleteItems(documentId: documentId)
        
        if result == true{
            let resultAler = UIAlertController(title: "완료", message: "삭제 되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
                
                
            })
            resultAler.addAction(onAction)
            present(resultAler, animated: true)
        }else{
           
                let resultAler = UIAlertController(title: "실패", message: "에러 발생.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default)
                resultAler.addAction(onAction)
                present(resultAler, animated: true)
        }
    }
    }
    

