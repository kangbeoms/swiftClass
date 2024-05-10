//
//  ViewController.swift
//  Summary_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblWhat: UILabel!
    @IBOutlet weak var tfPoint: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnGo: UIButton!
    // 입력될 텍스트
    let pointText = ["국어 점수","수학 점수","영어 점수","요약"]
    var TextCount = 0
    // 버튼의 텍스트 변화
    let buttonText = ["다음","계산하기"]
    // 점수를 저장하는 배열
    var SavedData: [Int]  = []
    
    var UpDown: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: init 시 화면에 띄울것들
        lblTitle.text = "성적 Summary"
        lblWhat.text = pointText[0]
        lblResult.text = ""
        btnGo.setTitle(String(buttonText[0]), for: .normal)
    }

    @IBAction func btnAction(_ sender: UIButton) {
        guard let text =  tfPoint.text else {return}
        SavedData.append(Int(text)!)
        tfPoint.text = ""
        TextCount += 1
        lblWhat.text = pointText[TextCount]
        if lblWhat.text == "영어 점수"{
            btnGo.setTitle(String(buttonText[1]), for: .normal)
        ShowResult()
        }
        
        
    }
    
    func ShowResult(){
        var tot = 0
        
        for i in 0..<SavedData.count {
            tot += SavedData[i]
            
        }
       let avg:Double =  Double(tot / SavedData.count)
        
        for j in 0..<SavedData.count{
            switch SavedData[j]{
            case avg >= Double(SavedData[j]) :
                UpDown.append("낮습니다.")
            case avg <= Double(SavedData[j]) :
                UpDown.append("높습니다.")
            case avg == Double(SavedData[j]) :
                UpDown.append("같습니다.")
            default:
                UpDown.append("같습니다.")
            }
        }
        
       let text1 = "총합은 \(tot) 입니다. \n 평균은\(avg) 입니다."
       let text2 = "국어 점수는 \(SavedData[0]) 이므로 평균보다 "
    }
}

