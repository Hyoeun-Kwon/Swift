//
//  ViewController.swift
//  Quiz_ServerImagePrevNext
//
//  Created by HyoEun Kwon on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
//    var imgNameLists = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    var imgLists : [UIImage] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //초기 화면
//        let url = URL(string: "http://192.168.245.130:8080/ios/\(imgNameLists[index])")
//        let data = try? Data(contentsOf: url!)
//        imageView.image = UIImage(data: data!)
        
        appendImgViewList()
        imageView.image = imgLists[0]
            
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//        for imageName in 0...index{
//            print(index)
//            imgNameLists.append("")
//        }
//    }
    
    func appendImgViewList(){
        for i in 1...6{
            var url = URL(string: "http://192.168.245.130:8080/ios/flower_0\(i).png" )
            let data = try? Data(contentsOf: url!)
            imgLists.append(UIImage(data: data!)!)
        }
    }
    
    
//    func loadServerImage(index: Int){
//        let url = URL(string: "http://192.168.245.130:8080/ios/\(imgLists[index])")
//        let data = try? Data(contentsOf: url!)
//        imageView.image = UIImage(data: data!)
//    }
    
    //이전버튼
    @IBAction func btnPreview(_ sender: UIButton) {
        index -= 1
        if index < 0{
            index = imgLists.count - 1
        }else{
            imageView.image = imgLists[index]
        }
    
    }//btnPreView
    
   
    
    //다음버튼
    @IBAction func btnNext(_ sender: UIButton) {
       index += 1
        if index >= imgLists.count{
            index = 0
        }else{
            //loadServerImage(index: index)
            imageView.image = imgLists[index]
        }
    }//btnNext
    
    
    
}//

