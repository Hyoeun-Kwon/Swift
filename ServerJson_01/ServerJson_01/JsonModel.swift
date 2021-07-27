//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by HyoEun Kwon on 2021/07/27.
//

// 불러오는 class 로 json data를 넘겨주는 방법
import Foundation

protocol JsonModelProtocol{ // protocol : 함수이름만 있음
    func itemDownloaded(items: NSArray)
    // data를 NSArray로 만들겠다! : NS : Next Step - 전통적인 방법 []
}


class JsonModel{
    //jsonmodel 이 portocol 을 가지고 있음
    var delegate: JsonModelProtocol! // data를 받아오는걸 연결하나!? ___( 나 )
    let urlPath = "http://192.168.245.130:8080/ios/student.json"
    
    func downloadItems(){
        // 서버에서 데이터 받아오는 동안 다른 일을 해야지!
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession.init(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded") // 다운로드 된거로 json 으로 감?
                self.parseJSON(data!) // 파싱을 만들자
            }
            
        }
        //task 실행
        task.resume()
    }
    
    //어싱크 방식 은 dispatch 가 들어감 , parsing 함수
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        do{
            //swift 에서 json 쓰는 방법
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            //JSONSerialization.ReadingOptions 는 더블클릭!
            //NSArray 가 변환이 쉬워서 사용: [] 임
        }catch let error as NSError{
            print(error)
        }
        
        //하나씩 뽑아오기
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()  // : ArrayList 라고 생각하면됨! <> NSArray
        // NSArray는 5개로 선언하면 5개만 사용 가능
        
        for i in 0..<jsonResult.count{// 결과를 한 묶음씩 알고있음
            jsonElement = jsonResult[i] as! NSDictionary // jsonElement 가 NSDictionary 이므로
            //왜 딕셔너리? json 파일이 변수명 : 값 으로 구성되어 있으므로
            
            //집어넣기 , code의 데이터 값 불러오기 (if let 사용)
            if let scode = jsonElement["code"] as? String, //scode 에는 S001 이 들어갈것임
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String, // json 에 있는 dept 키의 값을 가져옴
               let sphone = jsonElement["phone"] as? String{
                
                //DBModel 로 Bean (데이터 받아서 _ 생성자 만들었었음)
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                locations.add(query)
            }
    
        }
        
        //테이블 뷰도 실행되지만 얘도 동시에 실행되어야함 _ 어싱
        //async 방식은 DispatchQueue 사용
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            //itemDownloaded에게 파싱한 내용 주기
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
}


