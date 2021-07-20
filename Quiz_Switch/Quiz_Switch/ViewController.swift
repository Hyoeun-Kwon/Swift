//
//  ViewController.swift
//  Quiz_Switch
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblZoom: UILabel!
    @IBOutlet weak var lblSwitch: UILabel!
    
    var imgOn : UIImage? //켜진 전구 이미지
    var imgOff: UIImage? //꺼진 전구 이미지
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        //처음 이미지 할당
        imgView.image = imgOn
    }


    //확대 축소
    @IBAction func switchZoom(_ sender: UISwitch) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        switch sender.isOn{
        case true:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            lblZoom.text = "전구 축소"
            
        default:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            lblZoom.text = "전구 확대"
        }
        
       imgView.frame.size = CGSize(width: newWidth, height: newHeight)

    }//switch
    
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
    }
    
}//ViewController

