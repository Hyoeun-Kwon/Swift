//
//  ViewController.swift
//  Quiz4_ScoreSummary
//
//  Created by HyoEun Kwon on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var tfScore: UITextField!
    
    @IBOutlet weak var lblSummary: UILabel!
    
    var numSubject = 0
    var subjectName = ["국어 점수", "영어 점수", "수학 점수", "요약"]
    var score:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSubject.text =  subjectName[numSubject]
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        self.view.endEditing(true)
        numSubject += 1
//        if numSubject > subjectName.count-1{
//            numSubject = 0
//
//        }else{
                switch numSubject{
                case 1:
                    guard let num1 = Int(tfScore.text!)else { return }
//                    score.append(Int(tfScore.text!)!)
                    score.append(num1)
                    tfScore.text = ""
                    tfScore.becomeFirstResponder()
                    lblSummary.text = ""
                    
                case 2:
                    guard let num2 = Int(tfScore.text!)else { return }
                    score.append(num2)
                    tfScore.text = ""
                    tfScore.becomeFirstResponder()
                    lblSummary.text = ""
                case 3:
                    guard let num3 = Int(tfScore.text!)else { return }
                    score.append(num3)
                    tfScore.text = ""
                    tfScore.becomeFirstResponder()
                    tfScore.isHidden = true
                    calculation()
                    lblSummary.text = ""
                default:
                    tfScore.text = ""
                    numSubject = 0
                    lblSummary.text = ""
                    
                }
                
//            }
    
            lblSubject.text =  subjectName[numSubject]
            print(score)
        
    }// Button
    
    //keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
  
    //calculation 함수
func calculation(){
    
    var tot:Int = 0
    for i in 0..<subjectName.count-1{
          tot += score[i]
        }
    var avg = Double(tot) / 3
    
    lblSummary.text = "총점은 \(tot)입니다.\n평균은 \(String(format:"%.2f",avg))입니다."
    for i in 0..<subjectName.count-1{
        if Double(score[i]) > avg {
            lblSummary.text!.append("\n\(subjectName[i])는 \(score[i])이므로 평균보다 높습니다. ")
        }else if Double(score[i]) == avg {
            lblSummary.text!.append("\n\(subjectName[i])는 \(score[i])이므로 평균입니다.")
        }else {
            lblSummary.text!.append("\n\(subjectName[i])는 \(score[i])이므로 평균보다 낮습니다. ")
        }
 
    }

    }//calculation
    
    
//    func message(){
//        if
//    }

}//ViewController

