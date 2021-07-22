//
//  EditDelegate.swift
//  Navigation
//
//  Created by HyoEun Kwon on 2021/07/22.
//

//import Foundation

// Protocol : 자바의 interface
// 이름만 있고 기능은 없다.
protocol EditDelegate {
    // 누가 주냐면 : EditViewController 가 message를 준다!?
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}


