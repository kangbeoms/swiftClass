//
//  AddViewController.swift
//  FirebaseImage
//
//  Created by TJ on 2024/05/10.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    @IBOutlet weak var tfaddress: UITextField!
    @IBOutlet weak var tfrel: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    
    
       let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnUploadimage(_ sender: UIButton) {
        let photoAlert = UIAlertController(title: "사진 가져오기", message: "Photo 라이브러리에서 사진을 가져옵니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.picker.sourceType = .photoLibrary
                
                self.present(self.picker, animated: true)
            })
            let cancelAction = UIAlertAction(title: "Calcel", style: .cancel)
            
            photoAlert.addAction(okAction)
            photoAlert.addAction(cancelAction)
            
            present(photoAlert, animated: true)
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
            
    }
    
}


extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // (imagePicker)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageview.image = image
        }
       // dismiss(animated: true)
    }
}
