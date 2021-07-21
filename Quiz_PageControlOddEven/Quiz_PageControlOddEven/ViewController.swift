//
//  ViewController.swift
//  Quiz_PageControlOddEven
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //pageControl Setting
        pageControl.numberOfPages = 10
        pageControl.currentPage = 1
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
        lblNum.text = String(pageControl.currentPage)
    }

    @IBAction func pageControlAction(_ sender: UIPageControl) {
        
      
        if pageControl.currentPage % 2 == 0 {
            
            lblNum.text = String(pageControl.currentPage)
            lblNum.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
           
            
            
        }else{
           // let oddNum =  pageControl.currentPage
            lblNum.text = String(pageControl.currentPage)
            lblNum.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        
    }
    
    

}//

