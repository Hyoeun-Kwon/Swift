//
//  ViewController.swift
//  Quiz_AvgGrade
//
//  Created by HyoEun Kwon on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfKor: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEng: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = ""
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //계산버튼 누르면
    @IBAction func btnCalc(_ sender: UIButton) {
        self.view.endEditing(true)
        //빈칸 체크
        guard let korScore = Int(tfKor.text!) else {
            tfKor.becomeFirstResponder() // 커서 위치
            lblMessage.text = "국어 점수를 입력해주세요"
            return }
        
        guard let mathScore = Int(tfMath.text!) else {
            tfMath.becomeFirstResponder()
            lblMessage.text = "수학 점수를 입력해주세요"
            return }
        
        guard let engScore = Int(tfEng.text!) else {
            tfEng.becomeFirstResponder()
            lblMessage.text = "영어 점수를 입력해주세요"
            return }
       
        if( korScore > 100 || mathScore > 100 || engScore > 100){
            lblMessage.text = "100이하의 숫자를 입력하세요"
        }else{
            calculation(korScore, mathScore, engScore)
        }
        
        
        
    }//btnCalc
    
    // 계산 함수 만들기
    func calculation(_ korScore: Int,_ mathScore: Int,_ engScore: Int) {
        //_ 를 안써주면 위의 함수에서 korScore: korScore
        let result = korScore + mathScore + engScore
        let scoreAvg = Double(result) / 3
        var grade: String {
            scoreAvg >= 90 ? "수" :
            scoreAvg >= 80 ? "우" :
            scoreAvg >= 70 ? "미" :
            scoreAvg >= 60 ? "양" : "가"
        }
        
        lblMessage.text = "총합은 \(result)이며 평균은 \(String(format:"%.2f",scoreAvg))이고 등급은 \(grade)입니다. "
    }
    
}//View

