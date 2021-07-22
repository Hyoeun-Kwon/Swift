//
//  ViewController.swift
//  Quiz_TimerImage
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class TimerViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var numImg = 0
    var imgName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    // Timer
    let interval = 3.0
    var imgSelector:Selector = #selector(TimerViewController.imgChange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imgView.image = UIImage(named: imgName[numImg])
//        lblTitle.text = imgName[numImg]
        displayImg(numImg)
        
        
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: imgSelector, userInfo: nil, repeats: true)
        
    }//viewDidLoad
    
    // 3초마다 그림 바꾸기
    @objc func imgChange(){
        numImg += 1
        
        if numImg == imgName.count {
            numImg = 0
        }
        
        displayImg(numImg)
//        imgView.image = UIImage(named: imgName[numImg])
//        lblTitle.text = imgName[numImg]
        
    }// imgChange
    
    
    func displayImg(_ numImg: Int){
        imgView.image = UIImage(named: imgName[numImg])
        lblTitle.text = imgName[numImg]
    }
    


}//ViewController

