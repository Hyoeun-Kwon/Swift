//
//  SelectViewController.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class SelectViewController: UIViewController {

    
    
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var swIsRed: UISwitch!
    
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var lblRed: UILabel!
    
    // state set // prepare 에서 받은 변수 값 --> viewDidLoad에서 껏다 켜졌다 함.
    // 받아온 값을 모두에게 알려야 하므로 전역 변수 선언
    var isOn: Bool = true
    var isRed: Bool = false
    
    // 수정 후 (화면 back) //protocol : 이 번역기 쓸거에여! 얘 이름은 delegate에요, 사용하는 애는 SelectDelegate
    var delegate: SelectDelegate? //optional임 잊지말자.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //switch가 OnOff/Red 값을 받음
        // 메인 ViewController에서 보낸 값을 받은 전역변수-> 그 안에 들어온 값을 받음
        swIsOn.isOn = isOn
        swIsRed.isOn = isRed
        
        //On, Off
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        
        // Red
        if isRed{
            lblRed.text = "Red"
        }else{
            lblRed.text = "Yellow"
        }
    }//viewDidLoad
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            // 번역기에다가 지금 내 상태를 담아 말을 할거니 내 상태를 담아둔거에요
            delegate?.didImageOnOffDone(self, isOn: isOn, isRed: isRed) // 번역기에 담아 메인으로!(이전화면)
            // ---> 번역기에 담아 ViewController에 보냈는데 어..나는 몰라.. 라고 해버림 --> extension이 필요
            
            //delegate?.didImageRedDone(self, isOn: isRed)
            
        }//if
        // pop
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func swOn(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
            swIsRed.isEnabled = false
        }
        
        
    }
    
    
    @IBAction func swRed(_ sender: UISwitch) {
        if sender.isOn{
            isRed = true
            lblRed.text = "Yellow"
        }else{
            isRed = false
            lblRed.text = "Red"
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
