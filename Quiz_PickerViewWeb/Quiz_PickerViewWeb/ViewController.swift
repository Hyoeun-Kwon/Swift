//
//  ViewController.swift
//  Quiz_PickerViewWeb
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var pickerWebSite: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    
   
    var website = ["https://www.google.com", "https://www.naver.com", "https://www.daum.net"]
    var webNamesForUser = ["구글", "네이버", "다음"]
    let column = 1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //delegate 연결
        pickerWebSite.dataSource = self
        pickerWebSite.delegate = self
        
        // 0번째 웹사이트 들어가기
        loadWebPage(website[0])
        
        
    }
    // webPage 띄우기
    func loadWebPage(_ url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }

}//ViewController

// pickerView
extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return website.count
    }
}

extension ViewController: UIPickerViewDelegate{
    
    //titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return webNamesForUser[row]
    }
    
    //didSelectRow
    //picker를 움직였을때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadWebPage(website[row])
    }
    
}

