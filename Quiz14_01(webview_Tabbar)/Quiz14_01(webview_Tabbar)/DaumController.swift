//
//  DaumController.swift
//  Quiz14_01(webview_Tabbar)
//
//  Created by TJ on 2024/05/01.
//

import UIKit
import WebKit
class DaumController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let myurl = URL(string: "https://www.Daum.net") else{return}
              let myRequest = URLRequest(url: myurl)
                webview.load(myRequest)
    }
}
