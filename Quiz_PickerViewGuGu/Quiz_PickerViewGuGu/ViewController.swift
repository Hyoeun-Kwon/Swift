//
//  ViewController.swift
//  Quiz_PickerViewGuGu
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblDan: UILabel!
    @IBOutlet weak var pickerDan: UIPickerView!
    @IBOutlet weak var tvGuGuDan: UITextView!
    
    var viewColumn = 1
    
    var dan: [String] = []
   // var dan = Array<Int>(2...9) --> 가장 편함!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvGuGuDan.text.removeAll()
        
        //배열에 값 넣어주기
        for i in 2...9{
            dan.append("\(i)단")
        }
        
        //화면 맨위에 초기 값 2단 입력
        lblDan.text = dan[0]
        
        pickerDan.dataSource = self
        pickerDan.delegate = self
        
    }


}//ViewController

// 컬럼/ 데이터 갯수 // pickerView 모양
extension ViewController: UIPickerViewDataSource{
    //컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    //데이터
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dan.count // 몇 줄인지
    }
}


// 데이터 넣기 (이름구성 ) 액션 , Adapter (잡힌 모양에 데이터넣기)
extension ViewController: UIPickerViewDelegate{
    
    // PickerView에 Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       //row 는 0  부터
        return "\(dan[row])" // 배열로 잡은것, for문을 안돌려도 알아서 구성 해옴
    }
    
    
    // pickerView에 Image 선택 했을 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        tvGuGuDan.text.removeAll()
        let dan2 = Int(dan[row])!
        
        
        lblDan.text = "\(dan[row])"
        for i in 1..<10{
            tvGuGuDan.text += " \(dan2) X \(i) = \(dan2 * i)\n"
        }
        
    }
}
