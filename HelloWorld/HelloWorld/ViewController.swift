//
//  ViewController.swift
//  HelloWorld
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController { //ViewController를 상속, 클라스임 
    
    
    @IBOutlet weak var lblHello: UILabel!
    //IB(interface builder),Outlet: 연결자 (화면과 소스를 연결), weak / strong: weak(화면에서 벗어나면 메모리 x, strong(종료전까지 메모리에 저장)
    //var: 변수, UILabel:label속성
    
    override func viewDidLoad() { //java의 onCreate 같은 것!
        //viewDidLoad가 실행되고 화면이 뜨는 거임!
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblHello.text = "Hello World!"
        
    }


}

