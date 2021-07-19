//
//  ViewController.swift
//  Quiz_Message
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    //keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func btnSend(_ sender: UIButton) {
        tvResult.text += tfInput.text!+"\n"
        tfInput.text = ""
    }
    
    
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfInput.text! += "❤️"
    }
    
    
}//ViewController

