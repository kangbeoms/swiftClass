//
//  ViewController.swift
//  WebViewQuiz
//
//  Created by TJ on 2024/04/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    
//    var siteListD: [String : String] = ["www.naver.com" : "네이버"
//                                       , "www.google.com" : "구글",
//                                       "www.daum.net" : "다음",
//                                       "cnn.com" : "시엔엔",
//                                       "www.cbs.com" : "시비에스"
//    ]
        
    var siteName2 = [["www.naver.com","네이버"], ["www.google.com","구글"],[ "www.daum.net","다음"],["cnn.com","시엔엔"],["www.cbs.com","시비에스" ]]
    
    
//    var siteList = [
//        "www.naver.com","www.google.com","www.daum.net","cnn.com","www.cbs.com"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerview.dataSource = self
        pickerview.delegate = self
    }
    
    func loadWebPage(url: String){
        guard let myurl = URL(string: url) else{return}
        let myRequest = URLRequest(url: myurl)
        webView.load(myRequest)
    }
    
    
    @IBAction func act_stop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func act_refresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func act_goback(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func cat_goforward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return siteListD.count
        return siteName2.count
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return siteListD.values[row]
        return siteName2[row][1]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let getSite = "https://" + siteName2[row][0]
        loadWebPage(url: getSite)

        pickerview.dataSource = self
        pickerview.delegate = self
    }
}
