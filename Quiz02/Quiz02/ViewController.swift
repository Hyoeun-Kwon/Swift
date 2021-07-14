//
//  ViewController.swift
//  Quiz02
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tfNum1: UITextField!
    
    @IBOutlet weak var tfNum2: UITextField!
    
    
    @IBOutlet weak var tfAdd: UITextField!
    
    
    @IBOutlet weak var tfSub: UITextField!
    
    
    @IBOutlet weak var tfMul: UITextField!
    
    
    @IBOutlet weak var tfShare: UITextField!
    
    
    @IBOutlet weak var tfRemainder: UITextField!
    
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = ""
        
    }
    
    
    
    @IBAction func btnCal(_ sender: Any) {
        
        let num1 = Int(tfNum1.text!)
        let num2 = Int(tfNum2.text!) // 값이 있다 강제 선언_optional
        
        
        
        
        if( tfNum1.text?.count == 0 || tfNum2.text?.count == 0){
            lblMessage.text = " 값을 입력해 주세요 "
        }else{
            
            tfAdd.text = ""
            tfSub.text = ""
            tfMul.text = ""
            tfShare.text = ""
            tfRemainder.text = ""
        
        
        
            tfAdd.text = String(num1! + num2!)
            tfSub.text = String(num1! - num2!)
            tfMul.text = String(num1! * num2!)
            tfShare.text = String(num1! / num2!)
            tfRemainder.text = String(num1! % num2! )
            
            lblMessage.text = "계산 되었습니다!"
        
        }
        
        
        
        
    }
    
    
    
   // textfield 외에 아무데나 누르면
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //view 부분 (전체) 편집이 끝났다!
        //-----> 키보드 사라짐
        //필요하면 카피해서사용 (변화 x)
    }
    
    
    
}//---

