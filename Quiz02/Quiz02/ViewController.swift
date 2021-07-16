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
    
    //-------------------------------------------위: 선언 / 아래: viewDidLoad (한번 실행 후 실행x)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "숫자만 입력하세요!"
        
        //tfAdd.isUserInteractionEnabled = false 를 함수로 변환
        readOnly()
        
    }
    
    /*
     나쁜? 사용자 경우 :
     1. 숫자 입력 안했을떄 (전체 )—> 하나만 입력 안했으면?
     첫번째 칸 입력해줘라 + 포커싱 하기
     두번째 칸 입력해줘라 + 포커싱 하기
     2. 계산 완료 후 키보드 없어져야 겟다!
     3. 0으로 나눌때는 계산 불가하다고 뜨자
     */
    
    
    @IBAction func btnCal(_ sender: UIButton) {
        // Optional 제거
        // guarld let (if let도 있으나 잘 사용 안함) ---> 면접할때 많이 물어봄(guard let)
        // ! 가 빠진 거임
        // guard let은 data만 풀어주는 거임! 타입은 아님 (안풀어줌)
        guard let strNum1 = tfNum1.text else { return }
        guard let strNum2 = tfNum2.text else { return }
        
        if strNum1.isEmpty == true{
            tfNum1.becomeFirstResponder()
            lblMessage.text = "첫번째 숫자를 입력하세요!"
            
        }else if strNum2.isEmpty == true{
            tfNum2.becomeFirstResponder()
            lblMessage.text = "두번째 숫자를 입력하세요!"
        }else{
            let num1 = Int(strNum1)! //!는 타입바꾸기
            let num2 = Int(strNum2)!
            //---------------------------Check 부분
            
            //---------------------------계산 부분
            //calculation() // 계산 함수 만들기! _ 숫자를 가져가야 함
            calculation(num1, num2) // 함수 이름은 다 소문자로 시작한다
        }
        
        //guardlet으로 데이터 ! 를 풀고  num1 이라는 다른 변수에 타입을 풀어서 Int에 담고? 그 num1 을 매개변수로 한 함수로 계산
        
        
        //--------------------------아래 방법으로 했으나 소스 정리를 해야함 그래서 위의 Optional 제거 부터 다시 작성
       // if tfNum1.text?.count == 0  || tfNum2.text?.count == 0{
       // if tfNum1.text?.isEmpty == true || tfNum2.text?.isEmpty == true{ lblMessage.text = "숫자를 입력하세요"
//        if tfNum1.text?.isEmpty == true{
//            tfNum1.becomeFirstResponder()
//            lblMessage.text = "첫번째 숫자를 입력하세요!"
//        }else if tfNum2.text?.isEmpty == true{
//            lblMessage.text = "두번째 숫자를 입력하세요!"
//            tfNum2.becomeFirstResponder()
//        }else{
//            tfAdd.text = String(Int(tfNum1.text!)! + Int(tfNum2.text!)!)
//            tfSub.text = String(Int(tfNum1.text!)! - Int(tfNum2.text!)!)
//            tfMul.text = String(Int(tfNum1.text!)! * Int(tfNum2.text!)!)
//
//            //0으로 나눌때 아닐때
//            if tfNum2.text == "0"{
//                tfShare.text = "계산불가"
//                tfRemainder.text = "계산불가"
//            }else{
//                tfShare.text = String(Int(tfNum1.text!)! / Int(tfNum2.text!)!)
//                tfAdd.text = String(Int(tfNum1.text!)! % Int(tfNum2.text!)!)
//            }
//
//
//            lblMessage.text = "계산이 완료 되었습니다."
//            //키보드 없어지게 하기
//            self.view.endEditing(true)
//        }
        
              
    }
    
    
    
   // textfield 외에 아무데나 누르면
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //view 부분 (전체) 편집이 끝났다!
        //-----> 키보드 사라짐
        //필요하면 카피해서사용 (변화 x)
    }
    
    //계산 결과 값 read only로 처리
    //function , 함수 이름(){} , 필요하면 ()안에 argument 들어갈거임
    func readOnly(){
        //isUserInteractionEnabled 는 Readonly
        tfAdd.isUserInteractionEnabled = false
        tfSub.isUserInteractionEnabled = false
        tfMul.isUserInteractionEnabled = false
        tfShare.isUserInteractionEnabled = false
        tfRemainder.isUserInteractionEnabled = false
    }
    
    // 계산 함수
    func calculation(_ num1: Int, _ num2: Int){
        // _ : 변수이름 안보이게 함
        tfAdd.text = String(num1 + num2)
        tfSub.text = String ( num1 - num2)
        tfMul.text = String (num1 * num2)
        
        
        
        if num2 == 0 {
            tfShare.text = "계산불가"
            tfRemainder.text = "계산불가"
        }else{
            tfShare.text = String(num1 / num2)
            tfRemainder.text = String( num1 % num2)
        }
        

        lblMessage.text = "계산이 완료 되었습니다."
       //키보드 없어지게 하기
       self.view.endEditing(true)
    }
    
}//---ViewController

