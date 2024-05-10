//
//  DetailViewController.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import UIKit
import FirebaseStorage

class DetailViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfRelation: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // 이미지 변경
    @IBAction func btnChangePhoto(_ sender: UIButton) {
    }
    
    // 수정
    @IBAction func btnUpdate(_ sender: UIButton) {
    }
    
    // 삭제
    @IBAction func btnDelete(_ sender: UIButton) {
    }
    // 이미지 삭제
    func deleteImage(name: String){
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        // Note that in the URL, characters are URL escaped!
        let httpsReference = storage.reference(forURL: name)

        httpsReference.delete{ error in
            if let error = error{
                print("Error Delete : \(error)")
            }else{
                print("Successfully Deleted!")
            }
        }

    }   //deleteImage
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
