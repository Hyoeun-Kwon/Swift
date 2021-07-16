//
//  ViewController.swift
//  EvenSum
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
        lblMessage.text = ""
    }


    @IBAction func btnAdd(_ sender: UIButton) {
        //check부터 한다음에 unwrapping
        if tfNum1.text?.isEmpty == true || tfNum2.text?.isEmpty == true{
            lblMessage.text = "숫자를 입력하세요"
            
        }else{
            let num1: Int = Int(tfNum1.text!)!
            let num2: Int = Int(tfNum2.text!)!
            
            if num1 % 2 == 0, num2 % 2 == 0{
                    add(num1: num1, num2: num2)
                    lblMessage.text = "계산 되었습니다."
                }else{
                    lblMessage.text = "짝수만 입력해 주세요"
                }
        }
       
      
        
    }
    
//    // 다른 방법
//    let intNum1=Int(inputNum1.text!) ?? 0 // nil 이면 0을 주겠다, 아니면 입력된 값을 주겠다. 삼항연산자에 optional이 붙은 거임
//            let intNum2=Int(inputNum2.text!) ?? 0
//
//            if intNum1==0||intNum2==0{
//                lblMessage.text="짝수만 입력해주세요!"
//            }else if intNum1%2==0 && intNum2%2==0{
//                result.text="\(intNum1+intNum2)"
//                lblMessage.text="계산 완료"
//            }else{
//                lblMessage.text="짝수만 입력해주세요!"
//            }
    
    
    
    
    
    
    
    
//    func checkNil(str1: String!, str2: String) -> Int{
//        let check1 = str1.trimmingCharacters(in: .whitespacesAndNewlines)
//        let check2 = str2.trimmingCharacters(in: .whitespacesAndNewlines)
//        if check1.isEmpty == true || check2.isEmpty == true {
//            return 0
//        }else{
//            return 1
//        }
//    }
    
    
    // 덧셈 함수
    func add(num1: Int,num2: Int){
        let result: Int = num1 + num2
        tfResult.text = String(result)
        lblMessage.text = "계산 되었습니다."
    }
    
    // textfield 외에 아무데나 누르면
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
            tfNum1.text = ""
            tfNum2.text = ""
            tfResult.text = ""
     }
    

    
}//ViewController

