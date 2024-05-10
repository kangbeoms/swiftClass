//
//  ViewController.swift
//  swipeGesture
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgup: UIImageView!
    
    @IBOutlet weak var imgdown: UIImageView!
    
    @IBOutlet weak var imgleft: UIImageView!
    
    @IBOutlet weak var imgright: UIImageView!
    
    var imgLeft: [UIImage?] = []
    var imgRight: [UIImage?] = []
    var imgUp: [UIImage?] = []
    var imgDown: [UIImage?] = []
    
    let numberOfTouchs = 2 // 두손가락이 Max

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 설정하기
        makeImages()
        
        //초기 이미지
        imgup.image = imgUp[0]
        imgdown.image = imgDown[0]
        imgleft.image = imgLeft[0]
        imgright.image = imgRight[0]
        
        //한손가락 Gesture
        makeSingleTouch()
        
        //두손가락 Gesture
        makeDoubleTouch()
    }

    
    func makeImages() {
        imgUp.append(UIImage(named: "arrow-up-black.png"))
        imgDown.append(UIImage(named: "arrow-down-black.png"))
        imgLeft.append(UIImage(named: "arrow-left-black.png"))
        imgRight.append(UIImage(named: "arrow-right-black.png"))
        
        imgUp.append(UIImage(named: "arrow-up-red.png"))
        imgDown.append(UIImage(named: "arrow-down-red.png"))
        imgLeft.append(UIImage(named: "arrow-left-red.png"))
        imgRight.append(UIImage(named: "arrow-right-red.png"))
        
        imgUp.append(UIImage(named: "arrow-up-green.png"))
        imgDown.append(UIImage(named: "arrow-down-green.png"))
        imgLeft.append(UIImage(named: "arrow-left-green.png"))
        imgRight.append(UIImage(named: "arrow-right-green.png"))
    }
    func  makeSingleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
        
    }
    
    func  makeDoubleTouch(){
        let swipeUp2 = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture2(_ :)))
        swipeUp2.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp2.numberOfTouchesRequired = numberOfTouchs
        view.addGestureRecognizer(swipeUp2)
        
        let swipeDown2 = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture2(_ :)))
        swipeDown2.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown2.numberOfTouchesRequired = numberOfTouchs
        view.addGestureRecognizer(swipeDown2)
        
        let swipeLeft2 = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture2(_ :)))
        swipeLeft2.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft2.numberOfTouchesRequired = numberOfTouchs
        view.addGestureRecognizer(swipeLeft2)
        
        let swipeRight2 = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture2(_ :)))
        swipeRight2.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight2.numberOfTouchesRequired = numberOfTouchs
        view.addGestureRecognizer(swipeRight2)
    }
    
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgup.image = imgUp[0]
            imgdown.image = imgDown[0]
            imgleft.image = imgLeft[0]
            imgright.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgup.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgdown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgright.image = imgRight[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgleft.image = imgLeft[1]
            default:
                break
            }
        }
            
    }
    
    @objc func respondToSwipeGesture2(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgup.image = imgUp[0]
            imgdown.image = imgDown[0]
            imgleft.image = imgLeft[0]
            imgright.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgup.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgdown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgright.image = imgRight[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgleft.image = imgLeft[2]
            default:
                break
            }
        }
            
    }
}

