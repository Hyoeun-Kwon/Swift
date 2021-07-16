//
//  ViewController.swift
//  Quiz3_2_sum
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tfStartNum: UITextField!
    
    @IBOutlet weak var tfEndNum: UITextField!
    
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func btnSum(_ sender: UIButton) {
        let numCheck = checkNil(str1: tfStartNum.text!, str2: tfEndNum.text!)
            
        if numCheck == 1 {
          let resultSum = rangeSum(num1: tfStartNum.text!, num2: tfEndNum.text!)
            lblMessage.text = "\(resultSum)"
            tfStartNum.text = ""
            tfEndNum.text = ""
            
        }else{
            lblMessage.text = "숫자를 입력하세요"
            tfStartNum.text = ""
            tfEndNum.text = ""
        }
        
        
        
        
    }//btnSum
    

    
    func checkNil(str1: String!, str2: String) -> Int{
        let check1 = str1.trimmingCharacters(in: .whitespacesAndNewlines)
        let check2 = str2.trimmingCharacters(in: .whitespacesAndNewlines)
        if check1.isEmpty == true || check2.isEmpty == true {
            return 0
        }else{
            return 1
        }
    }
    

    
    func rangeSum(num1: String!, num2: String!) -> String{
        var sum: Int = 0
        let calcNum1: Int = Int(num1!)!
        let calcNum2: Int = Int(num2!)!
        
        if calcNum1 < calcNum2 {
            for i in calcNum1...calcNum2{
                sum += i
            }
        }else if calcNum1 == calcNum2{
                sum = calcNum1
        }else{
            for i in calcNum2...calcNum1{
                sum += i
            }
        }
        return "합계는 \(sum) 입니다. "
    }
    

}//View--

