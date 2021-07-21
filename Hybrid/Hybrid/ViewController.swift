//
//  ViewController.swift
//  Hybrid
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit
import WebKit // <<<<<<<WKWebView 사용 위해 ******* 잊지 말자

class ViewController: UIViewController {
    // 현재 ViewController는 UI를 상속받은거라 Wk 에 대한 내용 없음 -> WK 기능 사용 못함

    //textview, webview , activityIndicator 3개 outlet 연결
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let tempSite = "https://www.naver.com" //문자
//        let myUrl = URL(string: tempSite) // URL 타입으로 변경 _> 신호만 준것
//        let myRequest = URLRequest(url: myUrl!)//누가 받을지 알려줌
//        //Url 은 Optional 이므로 !
//        // 화면에 띄워라.
//        myWebView.load(myRequest)
        
        // 위의 과정을 버튼 누를때마다 해야해서 함수를 만든다.
        loadWebPage(url: "https://www.naver.com")
        
        // extension 연결
        myWebView.navigationDelegate = self
        
    }
    
    
    // 웹페이지 띄우기
    func loadWebPage(url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)//load : 네트워크 타고 다니는 것만 ! 일반 변수는 불가!
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage(url: "http://www.google.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage(url: "http://www.daum.net")
    }
    
    // Stop, Reload, GoBak, GoForward
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    //Go 버튼 누르면 해당 사이트로 이동
    @IBAction func btnGo(_ sender: UIButton) {
        // 내가 한 부분
//        var tfurl = "http://\(tfUrl.text!)"
//        loadWebPage(url: tfurl)
        
        //http 가 있는 경우 없는 경우 2가지 경우 생각
       let myUrl = checkUrl(tfUrl.text!)
        tfUrl.text = ""
        loadWebPage(url: myUrl)
    }
    
    //http 체크 여부 함수
    func checkUrl(_ url: String) -> String{
        //url 부분은 보여주기 싫음 _
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        // 앞에서부터 글자가 "" 되어있으면 t/f
        if !flag{
            strUrl += "http://"
        }
        return strUrl
    }
    
    
    //html : 변수를 써서 하는 법
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
            <html>
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width,initial-scale=1.0">
                </head>
                <body>
                    <h1>HTML String</h1>
                    <p>String변수를 이용한 웹페이지</p>
                    <p><a href = "http://jtbc.joins.com">JTBC</a>로 이동</p>
                </body>
            </html>
            """
        //load 아니고 loadHTMLString 사용**
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    //file : new file , empty 로 file 확장자를.html 로 위에 html 처럼 적고 command+s 로 저장 후
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        //forResource는 파일이름만, ofType은 확장자
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    
    
}//ViewController

// 현재 ViewController는 UI를 상속받은거라 Wk 에 대한 내용 없음 -> WK 기능 사용 못함
// ----> extension
extension ViewController: WKNavigationDelegate{
    
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
