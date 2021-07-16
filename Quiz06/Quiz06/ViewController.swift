//
//  ViewController.swift
//  Quiz06
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 첫화면을 어떻게 할까 ? 제목과 그림 띄워야 겠다.
        imgTitle.text = imageName[numImage] //배열name에 0번째 값을 넣어줘
        imgView.image = UIImage(named: imageName[numImage]) //UIImage가 알아서 그려서 넣어줌!
        // 그림 = 배열
        
        
    }
    
    @IBAction func btnPreview(_ sender: UIButton) {
        numImage -= 1
        if( numImage <= -1 ){
            numImage = imageName.count - 1
            
        }else{
            imgTitle.text = imageName[numImage]
            print(numImage)
            imgView.image = UIImage(named: imageName[numImage])
        }
        
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if ( numImage == imageName.count){
            numImage = 0
        }else{
            imgTitle.text = imageName[numImage]
            print(numImage)
            imgView.image = UIImage(named: imageName[numImage])
        }
        
    }
    
}// ViewController

