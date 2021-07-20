//
//  ViewController.swift
//  Quiz_GuGuDanGame
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // null 값
        if lblNum1.text?.count == 0 || lblNum2.text?.count == 0{
            tfInput.text = "값을 입력해주세요"
        }else{
            lblNum1.text = genNum()
            lblNum2.text = genNum()
        }
      
        
        
    }


    
    @IBAction func btnOk(_ sender: UIButton) {
        
        let num1 = Int(lblNum1.text!)!
        let num2 = Int(lblNum2.text!)!
        let result = num1 * num2
        
        let inputNum = Int(tfInput.text!)!
        
        if result == inputNum{
            let Alert = UIAlertController(title: "결과", message: "정답입니다.", preferredStyle: .alert)
            let correctAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {_ in
                self.tfInput.text?.removeAll()
                self.lblNum1.text = self.genNum()
                self.lblNum2.text = self.genNum()
            })
            
            Alert.addAction(correctAction)
            Alert.view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            Alert.view.layer.cornerRadius = 10
            present(Alert, animated: true, completion: nil)
            
        }else{
            let Alert = UIAlertController(title: "결과", message: "정답이 아닙니다..", preferredStyle: .alert)
            let wrongAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            Alert.addAction(wrongAction)
            Alert.view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            Alert.view.layer.cornerRadius = 10
            present(Alert, animated: true, completion: nil)
            
        }

        
    }
    
    
    func genNum() -> String{ //label은 string이므로!
        return String(Int.random(in: 1..<10))
    }


    
    
    
}//ViewController

