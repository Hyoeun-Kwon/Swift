//
//  ViewController.swift
//  Quiz_Gugudan
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfDan: UITextField!
    
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfDan.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    @IBAction func btnPrint(_ sender: UIButton) {
        tvResult.text.removeAll()
        
        if tfDan.text?.count != 0 {
            let dan = Int(tfDan.text!)!
            for i in 1..<10{
                tvResult.text += "\(dan) X \(i) = \(String(format: "%3d", (dan * i)))\n"
            }
            tfDan.text = ""
        }else{
            tvResult.text = "단을 입력해주세요"
        }
        
       
    }
        
    
}//ViewController

