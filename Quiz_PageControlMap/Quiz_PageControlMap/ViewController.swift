//
//  ViewController.swift
//  Quiz_PageControlMap
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // 다른프로젝트와도 연결이 가능하므로 연결후 항상 확인 및 주의!
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 내 위치
    let myLoc = CLLocationManager()
    
    var LocationList:[(String,Double,Double)] = [("혜화문", 37.5878892, 127.0037098),("흥인지문", 37.5711907, 127.009506),("창의문", 37.5926027, 126.9664771),("숙정문", 37.5956584, 126.9810576),("혜화문", 37.5878892, 127.0037098)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pageControl 세팅
        pageControl.numberOfPages = LocationList.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        
        // myLoc 설정
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        
        myMap.showsUserLocation = true // gps 허가 안된줄 앎
        // 포인터 찍기 ...
    }
    
    // 좌표값 + 글자 (현위치)
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1: String){
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        // 배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)// 지도비율
        
        // 좌표정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        // 현재 지도를 좌표 정보로 보이기
        myMap.setRegion(pRegion, animated: true)
        
        setPoint(pLoc, txt1)
    }
    
    // pin 찍기
    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String){// 위도 경도 같이 받아옴
        let pin = MKPointAnnotation() // pin도 준비되어있음
        pin.coordinate = loc
        pin.title = txt1
        lblLocation.text = txt1
        //---------------- pin 만든것
        
        //---------------- pin 화면에 찍기
        myMap.addAnnotation(pin)
        
        
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        // 페이지 변경시!
        mapMove(LocationList[pageControl.currentPage].1, LocationList[pageControl.currentPage].2, LocationList[pageControl.currentPage].0)

    }
    

}//ViewController

/*
 myLoc = CLLocationManager()가 호출시 자동 실행
 */

// gps 는 UIViewController가 몰라요!
// ViewController에게 알려준다, CLLocationManagerDelegate로 값을 가져온다.
// didUpdateLocations
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapMove(LocationList[pageControl.currentPage].1, LocationList[pageControl.currentPage].2, LocationList[pageControl.currentPage].0)    }
}

