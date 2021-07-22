//
//  ViewController.swift
//  PageControl
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    //pageControl은 outlet과 action 둘다 연결
    
    //이미지 배열
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png", "flower_06.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 처음화면
        imageView.image = UIImage(named: images[0])
        
        //pageControl Setting
        //페이지 몇갠지 알고잇어야해
        pageControl.numberOfPages = images.count //6페이지면 점이 6개 찍힘
        pageControl.currentPage = 0 // 처음 동그라미로 가있음!
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) //전체 동그라미 색상
        pageControl.currentPageIndicatorTintColor = UIColor.red // 현재 선택 페이지 색상
        
    }

    // 클릭하면 움직이는 곳
    @IBAction func pageChange(_ sender: UIPageControl) {
        // pageControl 에 currentPage만 잘 사용하면 아주 쉬움! +1 할 필요 없어
        // pageControl 은 알아서 currentPage를 알고잇어
        imageView.image = UIImage(named: images[pageControl.currentPage])
        
    }
    

}//ViewController

