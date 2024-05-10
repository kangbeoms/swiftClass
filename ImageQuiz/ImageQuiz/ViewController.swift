//
//  ViewController.swift
//  ImageQuiz
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var lblimageName: UILabel!
    
    var imageList = ["f_1","f_2","f_3","f_4"]
    var imageNum = 0
    var image2Num = 1
    var imamgeName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblimageName.text = imageList[imageNum]
        image1.image = UIImage(named: imageList[imageNum])
        image2.image = UIImage(named: imageList[image2Num])
        
    }

        
    @IBAction func btnnext(_ sender: UIButton) {
                imageNum += 1
                image2Num += 1
        if imageNum >= imageList.count {
                imageNum = 0
            
                image2Num = 1
                    showImage()
        
        }else{

            showImage()
        }
    }
    
    
    @IBAction func btnprev(_ sender: Any) {
      
        if imageNum == 0{
          
            imageNum = imageList.count
            image2Num = imageList.count + 1
            if image2Num > imageList.count{
                image2Num = imageNum + 1
                showImage()
            }
            
            showImage()
            
        }else{
            imageNum -= 1
            image2Num -= 1
            showImage()
            
        }
        
    }
    func showImage(){
        image1.image = UIImage(named: imageList[imageNum])
        image2.image = UIImage(named: imageList[image2Num])
    }
    
}

