//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //Alert
    @IBAction func btnAlert(_ sender: UIButton) {
        // Controller 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert) //Controller 만듬
        
        // Title, Message 외에는 다 버튼임, 버튼은 액션이 있다.
        
        //AlertAction
        //Action은 버튼 누름
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)//handler는 Closure 모양으로 정의해야함
        // 누르면 뭐 할래? handler에 정의 클로져로
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in // 클로져: Action in
            print("destructive action called.")
        })
        
        //cancel 버튼 만들기
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: {ACTION in
            print("cancel action called")
        })
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        //화면 띄우기
        present(testAlert, animated: true, completion: nil)
        
    }
    
    //ActionSheet
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // Controller 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet) //Controller 만듬
        
        // Title, Message 외에는 다 버튼임, 버튼은 액션이 있다.
        
        //AlertAction
        //Action은 버튼 누름
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)//handler는 Closure 모양으로 정의해야함
        // 누르면 뭐 할래? handler에 정의 클로져로
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in // 클로져: Action in
            print("destructive action called.")
        })
        
        //cancel 버튼 만들기
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: {ACTION in
            print("cancel action called")
        })
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        //화면 띄우기
        present(testAlert, animated: true, completion: nil)
    }
    
}

