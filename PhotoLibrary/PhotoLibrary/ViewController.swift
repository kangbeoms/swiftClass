//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by TJ on 2024/05/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
        
    }

    @IBAction func btnGo(_ sender: UIButton) {
        let photoAlert = UIAlertController(title: "사진 가져오기", message: "Photo 라이브러리에서 사진을 가져옵니다.", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.picker.sourceType = .photoLibrary
            
            self.present(self.picker, animated: true)
        })
        let cancelAction = UIAlertAction(title: "Calcel", style: .cancel)
        
        photoAlert.addAction(okAction)
        photoAlert.addAction(cancelAction)
        
        present(photoAlert, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // (imagePicker)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }
        dismiss(animated: true)
    }
}


