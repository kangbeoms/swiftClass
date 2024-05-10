//
//  ViewController.swift
//  pickerView_02
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerImage: UIPickerView!
    
    @IBOutlet weak var lblFileName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFile = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    
    var imageArray: [UIImage?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imageFile.count{
            let image = UIImage(named: imageFile[i])
            imageArray.append(image)
        }
        lblFileName.text = "selected Item : \(imageFile[0])"
        imageView.image = imageArray[0]
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }


}//ViewController

extension ViewController: UIPickerViewDataSource{
    //picker view 의 컬럼 갯수 (num)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // picker view 의 Row 갯수 (num)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
}

extension ViewController: UIPickerViewDelegate{
    // pickerview 에 fileName 배치 (title)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFile[row]
    }
    
    // pickerview 에 thumbnail 배치
    //(viewforRow)
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageview = UIImageView(image: imageArray[row])
        imageview.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        return imageview
    }
    
    
    
    
    // 선택된 파일명을 이미지로 보기 (didselect)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblFileName.text = "selected Item : \(imageFile[row])"
        imageView.image = imageArray[row]
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }
}
