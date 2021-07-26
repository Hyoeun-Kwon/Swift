//
//  HomePageViewController.swift
//  Quiz_Kanna_04InternetTableView
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit
import WebKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var receiveItem = ""
    
    @IBOutlet weak var lblWeb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       loadWebPage(url: receiveItem)
        
        myWebView.navigationDelegate = self
        lblWeb.text = receiveItem
        // Do any additional setup after loading the view.
    }
    
    
    
    func receiveItems(_ item: String){
        receiveItem = item
    }
    
    
    // 웹페이지 띄우기
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)//load : 네트워크 타고 다니는 것만 ! 일반 변수는 불가!
    }
    
    ////*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// 현재 ViewController는 UI를 상속받은거라 Wk 에 대한 내용 없음 -> WK 기능 사용 못함
// ----> extension
extension HomePageViewController: WKNavigationDelegate{
    
    //Indicator 시작
    // 웹 페이지로 보면 얘는 구동임
    // didCommit 을 찾으면 됨
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating() // -> 빙빙빙 돈다.
        myActivityIndicator.isHidden = false // hidden 을 풀어줘야 화면에 보임
    }
    
    // Indicator 종료
    //didFinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // Error 발생시
    // didFail
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
}//extension NavigationDelegate

