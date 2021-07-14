//
//  ViewController.swift
//  App_Quiz02Smile
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblSmile: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSmile.text = ""
    }


    @IBAction func btnSmile(_ sender: Any) {
        
        let smile = "😄"
        
    
        
        lblSmile.text?.append(smile)
        
    }
    
}//

