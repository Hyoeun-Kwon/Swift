//
//  ViewController.swift
//  MultiLine
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    //command + 마우스커서를 대보면 범위!가 표시 됨
    
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    //-------변수: 메모리에 올라감
    override func viewDidLoad() {
        //UIViewController가 만든것, 상속받음! so, override 를 사용 가능
        // 맨처음만 실행됨!(프로그램 첫 시작만!)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tvResult.isEditable = false // Read Only
    }


    
    @IBAction func btnAppend(_ sender: UIButton) {
        //빈칸 데이터는 제외한다.
        let strInput = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)//.whitespacesAndNewlines - 비어있는 enter값 막겠다.
        
        if !strInput.isEmpty{//비어있지 않으면!
            tvResult.text += tfInput.text! + "\n"
        }
        
        // optional 제거는 오른쪽에서 처리! 왼쪽으로는 넘겨만줌
        // tvResult.text = tfInput.text! 만 먼저 하고 실행해보고! 어 값이 누적 되어야 겠다.-> = 을 += 으로
        //또 실행 해봤더니 너무 붙어서 나와 -> 띄어쓰기를 넣자 + "\n"
        //실행 : 어!? 빈칸인채로 버튼을 누르면? 무조건 띄어지네? --> trim 하자
        // 제일 좋은 코딩 : comment로 먼저 코딩하는 것 (뭐 할거고 뭐 할거야! )
    }
    
}//ViewController

