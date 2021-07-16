//
//  ViewController.swift
//  EvenSum_P
//
//  Created by HyoEun Kwon on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    //계산 시
    @IBAction func btnCalc(_ sender: UIButton) {
        // 텍스트 필드에 빈칸이 있는지 없는지 확인 하는 방법
        let intNum1 = Int(tfNum1.text!) ?? 0 //nil 이면 0을 주겠다, 아니면 입력된 값을 주겠다. 삼항연산자에 optional이 붙은 거임
        let intNum2 = Int(tfNum2.text!) ?? 0
        
        if intNum1 == 0 || intNum2 == 0{
            lblMessage.text = "짝수만 입력해 주세요"
        }
    }
    
    

}

