//
//  ViewController.swift
//  Quiz08
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ImageController2: UIViewController {
    
    @IBOutlet weak var lblimageTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblimageTitle2: UILabel!
    @IBOutlet weak var imageBiew2: UIImageView!
    let timeselector: Selector = #selector(ImageController2.updateTime)
    
    //var imageList: [String] = []
    var imageList = ["f_1.jpg","f_2.jpg","f_3.jpg","f_4.jpg"]
    var imagecount = 0
    var imagecount2 = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeselector, userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        count += 1
        if count == imageList.count * 3{
            count = 0
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "a ss"
        imageView.image = UIImage(named: imageList[imagecount])
        lblimageTitle.text = imageList[imagecount]

           imagecount += 1
        if  imagecount == 4 {
            imagecount = 0
        }
        if (count % 3 == 0){
            second3()
        }
    }
    func second3() {
        imagecount2 += 1
        if imagecount2 == 4 {
            imagecount2 = 0
        }
        lblimageTitle.text = imageList[imagecount2]
        imageBiew2.image = UIImage(named: imageList[imagecount2])
    }
}
