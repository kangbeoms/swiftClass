//
//  AddViewController.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import UIKit
import FirebaseStorage

class AddViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfRelation: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPhoto: UIButton!
    
    let picker = UIImagePickerController()
    var downURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPhoto.isEnabled = false
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func insertImage(name: String){
        let storageRef = Storage.storage().reference()
        
        let image = imgView.image!
        guard let imageData = image.jpegData(compressionQuality: 0.4) else {return}
        
        let imageRef = storageRef.child("images/\(name).jpg")
        
        // Meta data
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        
        // Upload the file to th path "images/___.jpg"
        imageRef.putData(imageData, metadata: metaData){
            metaData, error in
            guard metaData != nil else{
                print("Error : putfile")
                return
            }
            
            // download URL after upload
            imageRef.downloadURL(
                completion: {
                    url, error in
                    guard let downloadURL = url else {
                        print("Error : DownloadURL")
                        return
                    }
                    self.downURL = "\(downloadURL)"
                    print(self.downURL)
            })
            
            print("------------ Compeleted to Insert a image --------------")
        }
    }
    @IBAction func nameCheck(_ sender: UITextField) {
        if !tfName.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            btnPhoto.isEnabled = true
        }else{
            btnPhoto.isEnabled = false
        }
    }
    
    
    /*
     * 불러오면 firestorage에 이름 파일명으로 저장.
     * 이름을 넣지 않으면 버튼이 활성화 되지 않게하기.
     */
    @IBAction func btnLoadPhoto(_ sender: UIButton) {
        let photoAlert = UIAlertController(title: "사진 가져오기", message: "Photo Library에서 사진을 가져옵니다.", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            ACTION in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        photoAlert.addAction(okAction)
        photoAlert.addAction(cancelAction)
        
        present(photoAlert, animated: true)
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        guard let name = tfName.text else {return}
        guard let phone = tfName.text else {return}
        guard let address = tfName.text else {return}
        guard let relation = tfName.text else {return}
        var image = downURL
        
        if !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let insertModel = InsertModel()
            
            let result = insertModel.insertItems(name: name, phone: phone, address: address, relation: relation, image: image)
            
            if result == true{
                let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                    ACTION in self.navigationController?.popViewController(animated: true)
                })
                resultAlert.addAction(okAction)
                present(resultAlert, animated: true)
            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생했습니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                    ACTION in self.navigationController?.popViewController(animated: true)
                })
                resultAlert.addAction(okAction)
                present(resultAlert, animated: true)
            }
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

}//AddViewController
extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        // image 등록
        insertImage(name: tfName.text!)
        dismiss(animated: true)
    }
}
