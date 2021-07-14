//
//  ViewController.swift
//  Computer
//
//  Created by HyoEun Kwon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    //잘못 설정시 : UI 에서 우클릭 후 연결을 해제 해준다. 그리고 소스랑 UI 를 다시 연결 하거나 지우고 다시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //순서 1.viewDidLoad 및 전역변수 , 2. 화면 보여주기 3.  버튼 누르는 등 행동시
        
    }//viewDidLoad

    @IBAction func btnOK(_ sender: UIButton) {
        //button은 Outlet아니고 Action
        let name: String = "맥북프로"
        let size: Int = 16
        let weight: Double = 2.56
        let bag: Bool = false
        let color: Character = "은"

        tfName.text = name
        tfSize.text = String(size)
        tfWeight.text = String(weight)
        //입력을 숫자만 하게 하고싶다? attribute에서  keyboard type을 numberPad 등으로 변경
        //혹시 시뮬레이터에서 키보드가 안나오면 command + k
        tfBag.text = String(bag)
        tfColor.text = String(color)
        
    }//btnOk
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        
        tfName.text = "" //혹은
        tfSize.text?.removeAll() // 도 가능
        tfWeight.text?.removeAll()
        tfBag.text = ""
        tfColor.text = ""
        
    }//btnClear
    
    
}//ViewController

