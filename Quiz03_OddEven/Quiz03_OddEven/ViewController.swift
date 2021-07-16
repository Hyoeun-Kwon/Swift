//
//  ViewController.swift
//  Quiz03_OddEven
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tfNum: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    //--------------------------------------선언부
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = ""
    }

    // textfield 외에 아무데나 누르면
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
     }
    
    //버튼 누르면 입력 안할때 판별 후 판별 함수
    @IBAction func btnDistinguish(_ sender: UIButton) {
        
        
        // 쌤 방법 2 ******** 추천!!
        // 함수를 하나 만들 거임 checkNil 함수
        let numCheck = checkNil(str: tfNum.text!) // 함수를 통해 0혹은 1 로 들어옴
        //함수 잘 써야 메모리 효율도 좋음
        if numCheck == 1 {
            let returnValue = numberDecision(str: tfNum.text!)
            lblMessage.text = "입력하신 숫자는 \(returnValue)입니다."
        }else{
            lblMessage.text = "숫자를 확인하세요!"
        }
        
        
        
        
        
        /*
        // 쌤 방법 1
        var message: String
        // optional 과 삼함연산자 동시 사용 __ 아무것도 안적으면 나는 0이라고 간주 할거다!
        // 그래서 placeholder 도 0 으로 줌
        
        let checkNumber = Int(tfNum.text!) ?? 0
        if checkNumber % 2 == 0{
            message = "짝수"
        }else{
            message = "홀수"
        }
        lblMessage.text = "입력하신 숫자는 \(message)입니다."
        */
        
        
        
        
        //내가 푼 방식
//        guard let strNum = tfNum.text else { return }
//
//        if strNum.isEmpty == true{
//            tfNum.becomeFirstResponder()
//            lblMessage.text = "숫자를 입력하세요"
//        }else{
//            let num = Int(strNum)!
//            distinguish(num)
//        }
        
    }//btnDistinguish
    
    
    // 판별 함수 : 내가 함
    func distinguish(_ num: Int){
       
        if num % 2 == 0 {
            lblMessage.text =  "짝수입니다."
            self.view.endEditing(true)
            tfNum.text = ""
        }else{
            lblMessage.text =  "홀수입니다."
            self.view.endEditing(true)
            tfNum.text = ""
        }
        
    }
    
    
    //---------------쌤 2번째 방법 함수1
    //data 있는지 없는지 모르므로 optional로 잡아줘야함
    func checkNil(str: String!) -> Int{ //return은 Int로 줄 거야
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)//enter/ spacebar 체크!!
        if check.isEmpty{
            return 0 //비어있으면 0 아니면 1 을 반환 할거임
        }else{
            return 1
            //return을 t/ f 로 받아도 좋음 (메모리 효율이 제일 좋음)
        }
        
    }
    
    //---------------쌤 2번째 방법 함수2
    //홀수인지 짝수인지 판별하는 함수
    func numberDecision(str: String!) -> String{ //tfInputnum 줄거니까 optional 임
        if Int(str)! % 2 == 0{
            return "짝수"
        }else{
            return "홀수"
        }
    }

}//ViewController

