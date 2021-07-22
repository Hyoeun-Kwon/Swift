//
//  SelectDelegate.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/22.
//

// 번역기 : 태국어로 뭐라고 말하며는 뭐가 돼요
protocol SelectDelegate {
    
    func didImageOnOffDone( _ controller: SelectViewController, isOn: Bool, isRed: Bool)
    
  //  func didImageRedDone(_ controller: SelectViewController, isOn: Bool)
}
