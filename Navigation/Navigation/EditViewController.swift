//
//  EditViewController.swift
//  Navigation
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    //받아주는 애(button 눌렀는지 bar button 눌렀는지)
    var textWayValue: String = "" //앞의 ViewController가 여기에 글씨를 써 줄거임 
    
    // textField 에 적힌 값을 받아올 변수
    var textMessage: String = ""
    
    // 전구
    var isOn: Bool = false
    
    // 수정 후 (화면 백)
    var delegate: EditDelegate? //optional 임 잊지말자.
    
    override func viewDidLoad() {
        // 뒤에 있는 viewDidLoad는 매번 실행 됨! ***** 맨처음인 ViewController의 viewdidLoad만이 딱 한번 실행
        super.viewDidLoad()
        // textWayValue 에 들어온 값을 처리 (글 넣어주기)
        // class 는 call by reference 임
        lblWay.text = textWayValue
        
        //textField Message
        tfMessage.text = textMessage
        
        //switch 에다가 isOn 값을 전달
        swIsOn.isOn = isOn  // ViewController에서 전달한 값에 따라 스위치 모양 변경
        // 라벨의 On, Off 전환 _ 그전화면에서 전구가 켜있으면 메시지에 On/Off
        if isOn{
            //true 이면
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        
    }
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{//쌤은 습관적으로 적음 (안적어도 되지만)
            delegate?.didMessageEditDone(self, message: tfMessage.text!) // delegate 함수를 통해 메세지 넘겨줄게(실행시키는 애 )
            //수정화면이 메인화면 위쪽에 있는 것임
            
            //전구
            delegate?.didImageOnOffDone(self, isOn: isOn) // 이 isOn 상태에 따라 (꺼져있다면) 이미 ViewController의 전구가 꺼져있음
        }
        //pop : 맨 뒤에꺼부터 하나씩 없앤다. (파이썬때)-> 수정화면이 없어지고 메인 화면이 뜨는 것
        navigationController?.popViewController(animated: true)// 꺼져있던 전구가 pop 하면서 화면에 보이는 것 
        // 이 값을 받는건? ViewController 임 --> ViewController로 가자 -extension
    }
    
    
    //스위치를 껏다 켰다 할때 바뀌는 거
    @IBAction func swImageOff(_ sender: UISwitch) {
        //sender가 알고있음
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
