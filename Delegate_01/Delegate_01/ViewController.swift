//
//  ViewController.swift
//  Delegate_01
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 확장 기능 연결
        tfInput.delegate = self // viewController에 있는 기능을 확장!
        //tf를 여러개 연결시 -> delegate 여러개 연결 이 delegate는 하나의 UITextFieldDelegate로 들어감
        
        
        //self : viewController - this 와 같다.
    }


    @IBAction func btnAction(_ sender: UIButton) {
        lblResult.text = tfInput.text // 옵셔널 = 옵셔널
        // 옵셔널(값이 있을 수도 있고 없을 수도 있음) = 옵셔널!  + " " (값이 있다고 아예 못 박는 것)

    }
    
  
    
}//ViewController

// return 을 눌렀을때 값이 입력 되도록 하고 싶음
// viewController의 기능을 확장

//delegate는 준비되어있음 -> 찾아주면 됨 : UITextFieldDelegate
// UITextFieldDelegate -> delegate!!!
// 기능 만들기.
extension ViewController: UITextFieldDelegate{
    //return 버튼 : textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        lblResult.text = tfInput.text
        lblResult.text = textField.text // tfInput.text로 특정하지 않고 여러(전체) textField의 값으호 전체 textField에 대해 적용시켜주기
       
        // 만약 tfInput.text 특정한다면 이 안에서 switch문 돌려야 함
        return true  //textFieldShouldReturn의 타입이 bool 이다.
    }
}
