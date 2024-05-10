//
//  ViewController.swift
//  image
//
//  Created by TJ on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    
    var imageName = ["f_1","f_2","f_3","f_4"]
    
    var numImage =  0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        display()
    }

    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage >= imageName.count{
            numImage = 0
            display()
        }else{
            display()
        }
    }
    
    
    @IBAction func btnpre(_ sender: Any) {
      	
        if numImage <= 0 {
            numImage = imageName.count
            display()
            
        }else{
            numImage = numImage - 1
            display()
          
        }
            
    }
    
    func display (){
        lblTitle.text = ">>> \(imageName[numImage]) <<<"
        imgview.image = UIImage(named: imageName[numImage])
    }
    }


