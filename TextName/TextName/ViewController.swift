//
//  ViewController.swift
//  TextName
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "환영 합니다!"
    }

    
    @IBAction func btnSend(_ sender: UIButton) {
        if tfName.text?.count == 0 {
            lblMessage.text = "텍스트를 입력하세요!"
        }else{
            lblWelcome.text = "Welcome! \(tfName.text!)"
            lblMessage.text = "텍스트를 추가했습니다!"
        }
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblWelcome.text = "Welcome!"
        tfName.text?.removeAll()
        lblMessage.text = "화면 초기상태 입니다."
    }
    

}//-------

