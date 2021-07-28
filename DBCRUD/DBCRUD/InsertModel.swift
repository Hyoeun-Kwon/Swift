//
//  InsertModel.swift
//  DBCRUD
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import Foundation

//insert는 protocol이 필요없음
class InsertModel{
    //jsonmodel 이 portocol 을 가지고 있음
    var urlPath = "http://192.168.237.130:8080/ios/studentInsert_ios.jsp" // + urlAdd ( ?와 & 로 쭉쭉 이어갈 거임)
    
    func insertItems(code: String, name: String, dept: String, phone:String) -> Bool { //data를 달고 넘어와서 DB연결해야함
        // Error message를 주기위해 Bool ( 잘됏다 아니다!)
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)" // 띄어쓰기하면 안됨!
        urlPath = urlPath + urlAdd // 진짜 url
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)! //얘는 optional이므로 ! // 한글이 %로 쫙!
        

        // 서버에서 데이터 받아오는 동안 다른 일을 해야지!
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default) //Session만듬, Foundation 안써도 됨!
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            // data, response, error 타입
            //서버에서 신호주는거: response, 브라우저에서 신호주는것: request
            if error != nil{
                print("Failed to insert data")
                result = false
            }else{
                print("Data is Inserted")
                result = true
                
            }
            
        }
        // resume 위에 url, defaultSission, task 는 선언임
        //task 실행
        task.resume()
        return result
    }

}//-----
