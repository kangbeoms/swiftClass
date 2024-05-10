//
//  ViewController.swift
//  Hybrid
//
//  Created by TJ on 2024/04/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var tfurl: UITextField!
    @IBOutlet weak var mywebview: WKWebView!
    
    @IBOutlet weak var myAcvtivityIndicater: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mywebview.navigationDelegate = self
        
        loadWebPage(url: "https://www.naver.com")
    }
    
    func loadWebPage(url: String){
        guard let myurl = URL(string: url) else{return}
        let myRequest = URLRequest(url: myurl)
        mywebview.load(myRequest)
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        let flag2 = strUrl.hasPrefix("https://")
        
        if !(flag || flag2){
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        guard let urlTf = tfurl.text else {return}
        let myurl = checkUrl(urlTf)
        tfurl.text = ""
        loadWebPage(url: myurl)
    }
    @IBAction func btnSite1(_ sender: UIButton) { // Google
        loadWebPage(url: "https://www.google.com")
    }
    @IBAction func btnSite2(_ sender: UIButton) { // Daum
        loadWebPage(url: "https://www.daum.net")
    }
    
    @IBAction func btnSite3(_ sender: UIButton) {
        let htmlString = """
        <html>
           <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=divice-width, initial-scale=1.0">
           </head>
            <body>
        <h1>HTML String</h1>
    <p> String 변수를 이용한 웹페이지</p>
    <p><a href=\"https://jtbc.co.kr\">JTBC</a> 로 이동</p>
            </body>
        </html>
    """
        
    mywebview.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnSite4(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        guard let filePath2 = filePath else {return}
        let myurl = URL(filePath: filePath2)
        let myRequest = URLRequest(url: myurl)
        mywebview.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        mywebview.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        mywebview.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        mywebview.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        mywebview.goForward()
    }
}//ViewController

extension ViewController: WKNavigationDelegate{
    //Indicater 시작 (didcommit)
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myAcvtivityIndicater.startAnimating()
        myAcvtivityIndicater.isHidden = false
    }
    
    //Indicater 종료 (didFinish)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myAcvtivityIndicater.startAnimating()
        myAcvtivityIndicater.isHidden = true
    }
    
    //Error 발생시 (didfail)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myAcvtivityIndicater.stopAnimating()
        myAcvtivityIndicater.isHidden = true
    }
}

