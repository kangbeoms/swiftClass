//
//  ViewController.swift
//  PageControl_Map
//
//  Created by TJ on 2024/05/09.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWhat: UILabel!
    @IBOutlet weak var locationMap: MKMapView!
    @IBOutlet weak var pageCon: UIPageControl!
    
    let locationDict = [
        "혜화문": (latitude: 37.5878892, longitude: 127.0037098),
        "흥인지문": (latitude: 37.5711907, longitude: 127.009506),
        "창의문": (latitude: 37.5926027, longitude: 126.9664771),
        "숙정문": (latitude: 37.5956584, longitude: 126.9810576)
    ]

    let myLoc = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               // 페이지 컨트롤 동그라미 갯수 정하기
        pageCon.numberOfPages = locationDict.count
               // 시작시 페이지 번호
        pageCon.currentPage = 0
        pageCon.pageIndicatorTintColor = .green
               // 선택시 동그라미 색깔변화
        pageCon.currentPageIndicatorTintColor = .red

        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        locationMap.showsUserLocation = true // 지도에서 현재 위치 보이기
       
        
    }

    @IBAction func Move_page(_ sender: UIPageControl) {
        //lblWhat.text = locationDict[pageCon.currentPage]
        //locationList[pageCon.currentPage]
        switch pageCon.currentPage{
        case 0 :
                moveL("혜화문")
        case 1 :
            moveL("흥인지문")
        case 2 :
            moveL("창의문")
        case 3 :
            moveL("숙정문")
        default:
            break
            
        }
    }
    
    func moveL(_ whatLocation: String) {
        let lat  = locationDict[whatLocation]!.latitude
          let lon = locationDict[whatLocation]!.longitude
          mapMove(lat, lon, whatLocation)
    }
    
    func mapMove(_ lat: CLLocationDegrees, _ lon:CLLocationDegrees, _ txt1: String){
           let pLoc = CLLocationCoordinate2DMake(lat, lon)
           
           // 배율
           let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
           
           // 좌표
           let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
           
           // 현재 지도를 좌표정보로 보이기
        locationMap.setRegion(pRegion, animated: true)
        lblWhat.text = txt1
        
        setPoint(pLoc, txt1)
       }
    // 위치 핀 찍기
      func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String ){
          let pin = MKPointAnnotation()
          pin.coordinate = loc
          pin.title = txt1
          
          locationMap.addAnnotation(pin)
      }

}

extension ViewController: CLLocationManagerDelegate{
    // (didup)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapMove((locationDict["혜화문"]!.latitude), (locationDict["혜화문"]!.longitude), "혜화문")
        myLoc.stopUpdatingLocation() // 좌표 받기 중지

    }
}
