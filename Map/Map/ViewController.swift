//
//  ViewController.swift
//  Map
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    
    //segment: 버튼 모양이바뀔꺼니까 _ outlet에도 있어야 함
    @IBOutlet weak var locationGo: UISegmentedControl!
    @IBOutlet weak var myMap: MKMapView! // import MapKit
    @IBOutlet weak var addr1: UILabel!
    @IBOutlet weak var addr2: UILabel!
    
    
    //내 위치
    let myLoc = CLLocationManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        myMap.showsUserLocation = true
        //-------------------------포인터 찍는 것
        // 그림그리는거 아직 안함
    }
    
    // 좌표값 + 글자( 현재위치 )
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1:String){
        let pLoc = CLLocationCoordinate2DMake(lat, lon) // 좌표 - 가운데 부분 잡아줌
        //배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) //MK: MapKit , latitudeDelta, longtitudeDelta는 바꿔도 됨!
        
        // 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        
        // 현재 지도를 좌표 정보로 보이기
        myMap.setRegion(pRegion, animated: true)
        
        let addrLoc = CLLocation(latitude: lat, longitude: lon)
        var txt2 = "" // 받는 데이터
        
        // 어느 주소인지 주소값 가져오는 것 : CLGeocoder
        // 한국과 미국은 반대이므로 : reverse
        // 2가지 아규먼트있는 함수라고 생각하면 됨 ( 2개의 클로져 이므로 place, error 라는 변수명 2개 사용 후 in
        CLGeocoder().reverseGeocodeLocation(addrLoc, completionHandler: {place, error in
            let pm = place!.first
            print(pm)
            //Optional(1 Stockton St, 1 Stockton St, 샌프란시스코, CA  94108, 미 합중국 @ <+37.78583400,-122.40641700> +/- 100.00m, region CLCircularRegion (identifier:'<+37.78587790,-122.40648400> radius 70.65', center:<+37.78587790,-122.40648400>, radius:70.65m))

            txt2 = pm!.country! // 국가명
            txt2 += " " + pm!.locality! // 시,도
            txt2 += " " + pm!.thoroughfare! // 동
            self.addr2.text  = txt2 // 함수안에 함수라 self
        })
        
        addr1.text = txt1
        setPoint(pLoc, txt1, txt2)
        
        
    }
    
    // pin 찍기
    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String, _ txt2: String){
        let pin = MKPointAnnotation() // pin도 준비되어있음
        pin.coordinate = loc
        pin.title = txt1
        pin.subtitle = txt2
        //---------------- pin 만든것
        
        //---------------- pin 화면에 찍기
        myMap.addAnnotation(pin)
        
        
    }
    
    
    
    
    //segment action
    @IBAction func locationGo(_ sender: UISegmentedControl) {
        // 몇번째 클릭했는지 : sender가 앎
        if sender.selectedSegmentIndex == 0{
            //현재위치
            myLoc.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            //둘리 뮤지엄
            mapMove(37.65243153, 127.0276397, "둘리 뮤지엄")
        }else if sender.selectedSegmentIndex == 2{
            //서대문 형무소
            mapMove(37.57244171, 126.9595412, "서대문 형무소 역사관")
        }
        
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
        let lastLoc = locations.last // location 가지고!
        //지도보기
        //-----여러 작업후
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재위치")
        //----
        myLoc.stopUpdatingLocation() // 좌표 받기 중지 *** 꼭 있어야 함
    }
}

