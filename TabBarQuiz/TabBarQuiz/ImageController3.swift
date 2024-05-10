//
//  ViewController.swift
//  pageControl
//
//  Created by TJ on 2024/04/30.
//

import UIKit

class ImageController3: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["f_1","f_2","f_3","f_4",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 페이지 컨트롤 동그라미 갯수 정하기
        pageControl.numberOfPages = images.count
        // 시작시 페이지 번호
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .green
        // 선택시 동그라미 색깔변화
        pageControl.currentPageIndicatorTintColor = .red
        // 선택된 이미지
        imageView.image = UIImage(named: images[pageControl.currentPage])
        
        //한손가락 Gesture
        makeSingleTouch()
        
    }

    @IBAction func pagechange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    func  makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ImageController3.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ImageController3.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)

    }
    
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
      
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage -= 1
                imageView.image = UIImage(named: images[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage += 1
                imageView.image = UIImage(named: images[pageControl.currentPage])
            default:
                break
            }
        }
            
    }
    
    
}

