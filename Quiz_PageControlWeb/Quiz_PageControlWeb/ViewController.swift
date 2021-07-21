//
//  ViewController.swift
//  Quiz_PageControlWeb
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblWebSiteName: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //var websiteNames = ["https://www.google.com", "https://www.naver.com", "https://www.daum.net"]
    var websiteNames:[(String,String)] = [("https://www.google.com","구글"),("https://www.naver.com","네이버"),("https://www.daum.net","다음")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음화면
        loadWebPage(websiteNames[0].0)
        lblWebSiteName.text = websiteNames[0].1
        
        //pageController Setting
        pageControl.numberOfPages = websiteNames.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
  
    }
    
    // webPage 띄우기
    func loadWebPage(_ url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }

    
    //pageControl 로 페이지 변경 될 때 마다 -> 사이트와 그 위의 라벨 변경
    @IBAction func pageChange(_ sender: UIPageControl) {
        lblWebSiteName.text = websiteNames[pageControl.currentPage].1
        loadWebPage(websiteNames[pageControl.currentPage].0)
        
    }
    

}//ViewController

