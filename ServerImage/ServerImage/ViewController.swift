//
//  ViewController.swift
//  ServerImage
//
//  Created by HyoEun Kwon on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    // 현재 asset 에 이미지 넣지 않았음!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //첫번째 방법: 사용자 폰에 쓰레기를 쌓게됨..: 옛날방식 알기만 하자
    @IBAction func btnImage1(_ sender: UIButton) {
        let url:URL = URL(string: "http://192.168.245.130:8080/ios/flower_01.png")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in // 안드로이드 어싱크테스트 구조랑 같음
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                    //png와 jpg 가 다름 현재는 Png
                    if let image = UIImage(data: data!){
                            // data 저장 방식
                        if let data = image.pngData(){
                            //가져온 데이터를 저장해서 보여줌
                            let filename = self.getDocumentDirectory().appendingPathComponent("copy.png")
                            // copy.png라고 이름 변경
                            // 그걸 저장 (아래)
                            try? data.write(to: filename)
                        }
                    }
                }
            }//else
            
        }//task
        
        // 어싱크
        task.resume()
        
    }//btnImage1
    
    // __/ ___/
    func getDocumentDirectory() -> URL { // 디렉토리 이름 만들기
        //해당위치 어디에 저장되었느냐
        // 사용자 폰에 저장후 보여줌
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    
    
    // 이 방법이 더 좋음! __ 요즘 방식! *** -----> viewDidLoad에 넣어주기
    @IBAction func btnImage2(_ sender: UIButton) {
        //jpg, png 차이도 없음! 
        let url = URL(string: "http://192.168.245.130:8080/ios/flower_02.png")
        //데이터 가져올거야
        let data = try? Data(contentsOf: url!)
        // 이름을 모르고, 순수한 데이터값! (파일 네임아님)
        imgView.image = UIImage(data: data!)
    }//btnImage2
    
}//----

