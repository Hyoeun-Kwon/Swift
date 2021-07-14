//
//  ViewController.swift
//  App_01.key
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfWelcome: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func btnName(_ sender: Any) {
        let name = " 권효은"
        tfWelcome.text?.append(name)
    
    }
    

}

