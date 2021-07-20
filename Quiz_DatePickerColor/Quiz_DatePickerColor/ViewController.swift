//
//  ViewController.swift
//  Quiz_DatePickerColor
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    let interval = 1.0
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //메시지
        lblSelectTime.text = "시간을 선택하세요"
        lblContent.text = ""
        
        //Timer Async 사용
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        //sender로 날짜 값 받기
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm"
        lblSelectTime.text = "\(formatter.string(from: datePickerView.date))"
  
    }
    
          

    @objc func updateTime(){
        //objc 타입으로 컴파일 됨/ #쓴거는 @로 받아야? 하는구나!
        let date = NSDate() // Next Step
        let formatter = DateFormatter() // 년, 월, 일 바꿔주는 애
        let formatterColor = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko") // 한국시간으로 나오게 해줘
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE: 요일, a:am/pm, hh:mm:ss 은 시간,분,초
       
        formatterColor.locale = Locale(identifier: "ko")
        formatterColor.dateFormat = "yyyy-MM-dd EEE HH:mm"
//        lblContent.text = "\(formatter.string(from: date as Date))"
        
        lblCurrentTime.text = "현재시간: \(formatter.string(from: date as Date))" //as Date : 타입 변경
        
        
        changeBackColor(현재시간: formatterColor.string(from: date as Date), 선택시간: lblSelectTime.text!)
        
    }
    
    
    
    func changeBackColor(현재시간 curtime: String, 선택시간 seltime: String){
        
        if curtime == seltime {
            switch count % 2 {
            case 0:
                view.backgroundColor = UIColor.red
            default:
                view.backgroundColor = UIColor.blue
            }
        }else{
            view.backgroundColor = UIColor.white
        }
        count += 1
    }
    
    
    
   
    
    
}//

