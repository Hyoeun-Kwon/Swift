//
//  ViewController.swift
//  Quiz_ImgSwipe
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imgCount = 0
    var imgName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //처음화면에 첫 그림
        imgView.image = UIImage(named: imgName[imgCount])
        
        //pageControl Setting
        pageControl.numberOfPages = imgName.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
        // 한손가락 Gesture 구성
        makeSingleTouch()
    }

    
    
    @IBAction func changeAction(_ sender: UIPageControl) {
        imgView.image = UIImage(named: imgName[pageControl.currentPage])
    }
    
    func makeSingleTouch(){

        // Swipe Up 설정
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down 설정
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
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
                imgView.image = UIImage(named: imgName[pageControl.currentPage])

            case UISwipeGestureRecognizer.Direction.right:
                // Swipe 를 오른쪽으로 했을 떄
                pageControl.currentPage += 1
                imgView.image = UIImage(named: imgName[pageControl.currentPage])
            default:
                break
                
            } // switch
        } // if let
    } // respondToSwipeGesture
    
    
    

}//ViewController

