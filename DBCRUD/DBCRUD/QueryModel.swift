//
//  QueryModel.swift
//  DBCRUD
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import Foundation

//쿼리모델이 데이터를 받아서 테이블 컨트롤러에 데이터를 주기 위해필요한 것 _ 입력, 수정 등은 필요없음
protocol QueryModelProtocol{
    // prepare 말고! 넘겨주기 위해 protocol 사용
    // protocol : 함수이름만 있음
    func itemDownloaded(items: NSArray)
    // data를 NSArray로 만들겠다! : NS : Next Step - 전통적인 방법 []
}


class QueryModel{
    //jsonmodel 이 portocol 을 가지고 있음
    var delegate: QueryModelProtocol!
    let urlPath = "http://192.168.237.130:8080/ios/student_query_ios.jsp"
    
    func downloadItems(){
        // 서버에서 데이터 받아오는 동안 다른 일을 해야지!
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession.init(configuration: URLSessionConfiguration.default) //Session만듬, Foundation 안써도 됨!
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            // data, response, error 타입
            //서버에서 신호주는거: response, 브라우저에서 신호주는것: request
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded") // 다운로드 된거로 json 으로 감?
                self.parseJSON(data!) // 파싱을 만들자
            }
            
        }
        // resume 위에 url, defaultSission, task 는 선언임
        //task 실행
        task.resume()
    }
    
    //바뀔게 없음! 형태가 배열안에 딕셔너리라서
    //어싱크 방식 은 dispatch 가 들어감 , parsing 함수
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()//어레이
        do{
            //swift 에서 json 쓰는 방법
            //jsonResult 에는 json file 자체가 들어감
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray //as는 casting
            // JSonSerialization 란? json파일이 swift에서는 맨처음이 [] 로 시작! {} 로 데이터 구별
            // Serialization 은 순서대로 처리하는 것!
            //JSONSerialization.ReadingOptions 는 더블클릭!
            //NSArray 가 변환이 쉬워서 사용: [] 임
        }catch let error as NSError{
            print(error)
        }
        
        //하나씩 뽑아오기
        var jsonElement = NSDictionary() // 딕셔너리 타입 [{},{}]
        let locations = NSMutableArray()  // : ArrayList 라고 생각하면됨! <> NSArray
        // 데이터를 넣었다 뺏다 하므로 Mutable임
        // NSArray는 5개로 선언하면 5개만 사용 가능
        
        
        //json은!! 무조건 String 으로 다 바꿔 사용 하는것이 좋음  SQLite와 다름
        for i in 0..<jsonResult.count{// 결과를 한 묶음씩 알고있음 현재 student.json 은 jsonResult.count가 2
            jsonElement = jsonResult[i] as! NSDictionary // jsonElement 가 NSDictionary 이므로
            //왜 딕셔너리? json 파일이 변수명 : 값 으로 구성되어 있으므로
            
            //집어넣기 , code의 데이터 값 불러오기 (if let 사용)
            if let scode = jsonElement["code"] as? String, //scode 에는 S001 이 들어갈것임
               //jsonElement(딕셔너리)의 0번째의 code는 scode로!
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String, // json 에 있는 dept 키의 값을 가져옴
               let sphone = jsonElement["phone"] as? String{
                
                //DBModel 로 Bean (데이터 받아서 _ 생성자 만들었었음)
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                //생성자에 데이터 넣음
                
                locations.add(query) // 2줄이 생김 (java Bean 처럼)
                //화면엔 아직 안떳음! json data가져와서 locations 라는 어레이에 집어 넣음!
            }
    
        }
        
        // 테이블 뷰를 만들때 데이터를 같이 가져올 수 있음
        // 스위프트는 class 에 async 라고만 적어주면 async야
        
        //테이블 뷰도 실행되지만 얘도 동시에 실행되어야함 _ 어싱
        //async 방식은 DispatchQueue 사용
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            //itemDownloaded에게 파싱한 내용 주기
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
}
