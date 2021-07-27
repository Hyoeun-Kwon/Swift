//
//  Students.swift
//  SQLite
//
//  Created by HyoEun Kwon on 2021/07/27.
//

import Foundation

//class _ nil 값 x 데이터가 있어야함
class Students{
    //항목들
    var id: Int
    var name: String? // name은 nil 값 허용: 안써도 돼!
    var dept: String?
    var phone: String?
    
    //생성자
    init(id: Int, name: String?, dept: String?, phone: String?){
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    
}
