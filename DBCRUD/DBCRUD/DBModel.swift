//
//  DBModel.swift
//  DBCRUD
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import Foundation

// 데이터 불러오는 것
class DBModel: NSObject{
    //그냥 써도 상관없으나 타입주는게 좋다! NSObject 가 가장 큼
    
    // Database 순서가 Json 순서임,!?
    
    // Property : 변수
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    //Empty constructor  //*** 잊지말자!
    override init() {
        
    }
    
    // 배열 만들때 사용 !?  // constructor  --> 실질적 사용
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
}//class
