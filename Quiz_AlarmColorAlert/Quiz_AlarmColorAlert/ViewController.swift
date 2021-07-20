//
//  ViewController.swift
//  Quiz_AlarmColorAlert
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    // 비교할 현재시간, 선택시간
    var currentTime = ""
    var selectTime = ""
    
    
    let interval = 1.0
    let timeSelector:Selector = #selector(ViewController.updateTime)
    var count: Int = 0
    var isAlarm = false // 알람 상태 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSelectTime.text = "시간을 선택하세요"
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // sender로 선택 시간 받기
        let selectDate = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        lblSelectTime.text = "\(formatter.string(from: selectDate.date))"
        selectTime = "\(formatter.string(from: selectDate.date))"
        isAlarm = false
    }
    
    
    @objc func updateTime(){
        
        let date = NSDate()
        let formatter = DateFormatter()
        let formatterOfColor = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        
        formatterOfColor.locale = Locale(identifier: "ko")
        formatterOfColor.dateFormat  = "yyyy-MM-dd EEE a hh:mm"
        
        lblCurrentTime.text = "현재시간 \(formatter.string(from: date as Date))"
        currentTime = "\(formatterOfColor.string(from: date as Date))"
        
        ChangeBackColor(현재시간: formatterOfColor.string(from: date as Date), 선택시간: lblSelectTime.text!)
        
        if !isAlarm{
            if selectTime == currentTime{
                let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!", preferredStyle: .alert)
                let okAlert = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: {ACTION in
                    self.isAlarm = true
                })
                
                alarmAlert.addAction(okAlert)
                alarmAlert.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                alarmAlert.view.layer.cornerRadius = 10
                present(alarmAlert, animated: true, completion: nil)
                
            }else{
                
            }
       
        }//
        
    }
    
    func ChangeBackColor(현재시간 curTime: String, 선택시간 selTime: String){
        
        if curTime == selTime{
            switch count % 2 {
            case 0:
                view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            default:
                view.backgroundColor = #colorLiteral(red: 1, green: 0.5464673042, blue: 0.7395377755, alpha: 1)
            }
            
        }else{
            view.backgroundColor = UIColor.white
        }
        
        count += 1
        
    }// changeBackColor

}//ViewController

