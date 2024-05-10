//
//  ViewController.swift
//  pagecontrol_webview
//
//  Created by TJ on 2024/04/30.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblwhatSite: UILabel!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var SiteName = ["www.naver.com","www.google.com","www.daum.net","m.nate.com","cnn.com","www.cbs.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 페이지 컨트롤 동그라미 갯수 정하기
        pageControl.numberOfPages = SiteName.count
        // 시작시 페이지 번호
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .green
        // 선택시 동그라미 색깔변화
        pageControl.currentPageIndicatorTintColor = .red
        loadWebPage(url: "https://" + String(SiteName[pageControl.currentPage]))
        
    }
    
    
    func loadWebPage(url: String){
        guard let myurl = URL(string: url) else{return}
        let myRequest = URLRequest(url: myurl)
        webview.load(myRequest)
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        let getSite = "https://" + String(SiteName[pageControl.currentPage])
            loadWebPage(url: getSite)
        lblwhatSite.text = SiteName[pageControl.currentPage]
            
    }
}

