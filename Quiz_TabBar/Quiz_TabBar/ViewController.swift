//
//  ViewController.swift
//  Quiz_TabBar
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnGoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    @IBAction func btnGoTimerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    
    @IBAction func btnGoPageConView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}//ViewController

