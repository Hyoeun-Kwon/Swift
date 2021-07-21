//
//  ViewController.swift
//  SwipeGesture
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    //두손가락
    // 시뮬은 두손가락이 최대값
    var numOfTouches = 2
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Image 설정하기
        makeImages()
        
        // 초기 Image
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 한손가락 Gesture 구성
        makeSingleTouch()
        
        //두손가락 Gesture 구성
        makeDoubleTouch()
    }
    
    //img 넣은 함수
    func makeImages(){
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
    }
    
    func makeSingleTouch(){
        //up
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // selector는 object c
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up // direction이 up이다 지정
        self.view.addGestureRecognizer(swipeUp)
        
        //down
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down // direction이 down이다 지정
        self.view.addGestureRecognizer(swipeDown)
        
        //left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left // direction이 left이다 지정
        self.view.addGestureRecognizer(swipeLeft)
        
        //right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right // direction이 right이다 지정
        self.view.addGestureRecognizer(swipeRight)
    }
    
    //up인지 down인지 받아야 함
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            //초기값 주기 : 검정색으로
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            //초기 값 주고 원하는 것만 색상 변경 할 거임 ----> 하나만 빨간색으로 보이게 하려고
            
            //제스쳐 방향
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1] // 1번 데이터 만들어주기 ( 다른색상: red)
            
            // 여기에 행동 지정
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
            }
        }
    }
    
    
    //----------------------------------- Option + Shift : 두손가락
    func makeDoubleTouch(){
        //up
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        // selector는 object c
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up // direction이 up이다 지정
        swipeUp.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUp)
        
        //down
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down // direction이 down이다 지정
        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        //left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left // direction이 left이다 지정
        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        //right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right // direction이 right이다 지정
        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    
    //up인지 down인지 받아야 함
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            //초기값 주기 : 검정색으로
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            //초기 값 주고 원하는 것만 색상 변경 할 거임 ----> 하나만 빨간색으로 보이게 하려고
            
            //제스쳐 방향
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2] // 1번 데이터 만들어주기 ( 다른색상: red)
            
            // 여기에 행동 지정
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }
    
    
    
    
}//----

