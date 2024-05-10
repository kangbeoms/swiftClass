//
//  NaverController.swift
//  Quiz14_01(webview_Tabbar)
//
//  Created by TJ on 2024/05/01.
//

import UIKit
import WebKit

class NaverController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myurl = URL(string: "https://www.naver.com") else{return}
              let myRequest = URLRequest(url: myurl)
                webview.load(myRequest)
        // Do any additional setup after loading the view.
    }
    
    
    
}
