//
//  AddViewController.swift
//  TableView_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class AddViewController2: UIViewController {

    @IBOutlet weak var tftext: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerList: UIPickerView!
    
    var imageList: [UIImage?] = []
    let imageFile = ["naver_29.png","google_29.png","daum_29.png"]
    var selectedimage = ""
    
    //var 프로토콜: DataToInsert?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addList()
        // Do any additional setup after loading the view.
        imageView.image = imageList[0]
        pickerList.dataSource = self
        pickerList.delegate = self
    }
    
    func addList(){
        for i in 0..<imageFile.count{
                  let image = UIImage(named: imageFile[i])
            imageList.append(image)
              }
    }
    
    @IBAction func btnAct_insert(_ sender: UIButton) {
       guard let text = tftext.text else {return}
//        프로토콜?.SavedDataInsert(self, dataState: "new", Message: text, image: selectedimage)
//
        DataToInsert.Message = text
        DataToInsert.dataState = "new"
        DataToInsert.image = selectedimage
        navigationController?.popViewController(animated: true)
    }


}
// MARK: 픽커뷰 익스텐션 부분
extension AddViewController2: UIPickerViewDataSource{
    //picker view 의 컬럼 갯수 (num)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // picker view 의 Row 갯수 (num)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
}

extension AddViewController2: UIPickerViewDelegate{
    // pickerview 에 fileName 배치 (title)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFile[row]
    }
    
    // pickerview 에 thumbnail 배치
    //(viewforRow)
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageview = UIImageView(image: imageList[row])
        imageview.frame = CGRect(x: 0, y: 0, width: 30 , height: 20)
        return imageview
    }
    
    
    // 선택된 파일명을 이미지로 보기 (didselect)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageList[row]
        
        selectedimage = imageFile[row]
    }
}
