//
//  ViewController.swift
//  Quiz_SwipePageConWeb
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var webSiteNames = ["https://www.google.com", "https://www.naver.com", "https://www.daum.net"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 웹사이트 설정
        loadWebPage(webSiteNames[0])
        
        // pageControl 설정
        pageControl.numberOfPages = webSiteNames.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

        // 한손가락 Gesture 구성
        makeSingleTouch()
        
        
    }
    
    // webPage 띄우기
    func loadWebPage(_ url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        loadWebPage(webSiteNames[pageControl.currentPage])
        print("current Page: \(pageControl.currentPage)")
    }
    
    func makeSingleTouch(){
        
        // Swipe Left 설정
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right 설정
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    } // makeSingleTouch
    
    
    // 한손가락 제스쳐
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        // gesture :  어디로 swipe했는지 받아야한다.
        // if let 은 swipe 를 애매하게 할때 nil 값이 들어오기 때문에 쓴다.
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
 
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                // Swipe 를 왼쪽으로 했을 떄
                pageControl.currentPage -= 1
                loadWebPage(webSiteNames[pageControl.currentPage])

            case UISwipeGestureRecognizer.Direction.right:
                // Swipe 를 오른쪽으로 했을 떄
                pageControl.currentPage += 1
                loadWebPage(webSiteNames[pageControl.currentPage])
                
            default:
                break
                
            } // switch
        } // if let
    } // respondToSwipeGesture
}//ViewController

