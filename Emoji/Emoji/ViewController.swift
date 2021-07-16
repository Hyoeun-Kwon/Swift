//
//  ViewController.swift
//  Emoji
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblEmoji: UILabel!
    
    var arrEmoji = ["😆","😄","😋","❤️","🦊","🐱"] //emoji는 글자임!
    var listEmoji: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = arrEmoji[0]
        
        //[]안에 몇번째인지를 변수로 놓고 +1 씩 한뒤 마지막이 뒤면 0번이 되라
    }


    @IBAction func btnPlay(_ sender: UIButton) {
        
        if listEmoji == 6{
            listEmoji = 1
            lblEmoji.text = "\(arrEmoji[0])"
        }else{
            lblEmoji.text = "\(arrEmoji[listEmoji])"
            listEmoji += 1
        }
    }
    
    
    
    @IBAction func btnPreview(_ sender: Any) {
        
        if listEmoji == 6{
            listEmoji = 1
            lblEmoji.text = "\(arrEmoji[0])"
        }else{
            lblEmoji.text = "\(arrEmoji[listEmoji])"
            listEmoji -= 1
        }
    
    }
    
    
}//View---

