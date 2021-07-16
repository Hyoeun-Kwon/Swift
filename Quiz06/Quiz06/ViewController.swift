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
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 첫화면을 어떻게 할까 ? 제목과 그림 띄워야 겠다.
//        imgTitle.text = imageName[numImage] //배열name에 0번째 값을 넣어줘
//        imgView.image = UIImage(named: imageName[numImage]) //UIImage가 알아서 그려서 넣어줌!
        displayImage(numImage: numImage)
        // 그림 = 배열
        
        
    }
    
    @IBAction func btnPreview(_ sender: UIButton) {
        numImage -= 1 // 상태 변수 set state
//        if( numImage <= -1 ){ // 배열은 - 1 등 마이너스가 없음!
        if numImage < 0 {
            numImage = imageName.count - 1
            //count 는 1,2,3,4,5 하지만 배열은 0,1,2,3,4 ..이므로 -1
            
        }else{
//            imgTitle.text = imageName[numImage]
//            imgView.image = UIImage(named: imageName[numImage])
            displayImage(numImage: numImage)
        }
        
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
//        if ( numImage == imageName.count){
        if numImage >= imageName.count{
            numImage = 0 //상태변수를 0번으로 보내주기
        }else{
//            imgTitle.text = imageName[numImage]
//            imgView.image = UIImage(named: imageName[numImage])
            displayImage(numImage: numImage) // 뒤 numImage 는 data 값
        }
    }
    
    
    
    // 함수는 분리 하는 것!
    // 반복되는 제목과 이미지 넣는것 배열로 만들기 (메모리 효율성 up - 퍼포먼스 좋아짐)
    // 1. 반복되는 것 안에 넣어보기 (제목, 이미지 배치)
    // 2. () 안에 뭐를 넣어야 할까? (매개변수) : 아 번호를 알려줘야 겠다. --> (numImage: Int) 넣기
    // 그림 번호만 넣어주면 화면에 찍어 주는 함수 완성!
    func displayImage(numImage: Int){
        imgTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
    
       
    
}// ViewController

