//
//  ViewController.swift
//  Map
//
//  Created by TJ on 2024/05/09.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var locationGo: UISegmentedControl!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var addr1: UILabel!
    @IBOutlet weak var addr2: UILabel!
    
    let myLoc = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        myMap.showsUserLocation = true // 지도에서 현재 위치 보이기
    }

    @IBAction func locationGo(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            myLoc.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            mapMove(37.65243153, 127.027637, "둘리 뮤지엄")
        }else if sender.selectedSegmentIndex == 2{
            mapMove(37.57244171, 126.9595412, "서대문 형무소")
        }
    }

    func mapMove(_ lat: CLLocationDegrees, _ lon:CLLocationDegrees, _ txt1: String){
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        
        // 배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        // 좌표
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        // 현재 지도를 좌표정보로 보이기
        myMap.setRegion(pRegion, animated: true)
        
        //주소 가져오기
        let addrLoc = CLLocation(latitude: lat, longitude: lon)
        var txt2 = ""
        
        CLGeocoder().reverseGeocodeLocation(addrLoc, completionHandler: {place, error in
            let pm = place!.first
            txt2 = pm!.country! //국가
            txt2 += " " + pm!.locality! // 시.도
            txt2 += " " + pm!.thoroughfare! // 동
            self.addr2.text = txt2
        })
        addr1.text = txt1
        
        setPoint(pLoc, txt1, txt2)
    }
    // 위치 핀 찍기
    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String, _ txt2: String){
        let pin = MKPointAnnotation()
        
        pin.coordinate = loc
        pin.title = txt1
        pin.subtitle = txt2
        
        myMap.addAnnotation(pin)
    }
    
}


extension ViewController: CLLocationManagerDelegate{
    // (didup)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("내 위치 update 실행")
        let lastLoc = locations.last
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재 위치")
        myLoc.stopUpdatingLocation() // 좌표 받기 중지

    }
}



