//
//  ViewController.swift
//  Emoji
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblEmoji: UILabel!
    
    var arrEmoji = ["π","π","π","β€οΈ","π¦","π±"] //emojiλ κΈμμ!
    var listEmoji: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = arrEmoji[0]
        
        //[]μμ λͺλ²μ§ΈμΈμ§λ₯Ό λ³μλ‘ λκ³  +1 μ© νλ€ λ§μ§λ§μ΄ λ€λ©΄ 0λ²μ΄ λλΌ
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

