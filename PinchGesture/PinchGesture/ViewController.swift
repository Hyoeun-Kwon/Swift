//
//  ViewController.swift
//  PinchGesture
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :))) //object c 는 비어있는것도 (_ :) 라고 작성(비어있다)
        self.view.addGestureRecognizer(pinch) // view로 줘야 전체에 pinch를 준다.
    
    
    }//viewDidLoad
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        //swipe는 UIGestureRecongizer로 switch문 작성했지만 얘는 하나만 있으므로 PinchGestureRecognizer tkdyd
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        //손가락 으로 쭉 확대하면 어느정돈지 알고있음 (pinch.scale)
        pinch.scale = 1 //기준값 정해주기 (확대하고나면 1크기야)
        
    }//doPinch


}//ViewController

