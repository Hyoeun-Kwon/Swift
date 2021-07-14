//
//  ViewController.swift
//  AppQuiz2_Smile
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblSmile: UILabel!
    
    var smile = "😄"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSmile.text = ""
    }
    
    
   
    @IBAction func btnSmile(_ sender: UIButton) {
        
        lblSmile.text?.append(smile)
        
    }
    
}//ViewController

