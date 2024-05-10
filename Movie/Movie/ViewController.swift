//
//  ViewController.swift
//  Movie
//
//  Created by TJ on 2024/05/09.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMovie(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "vidio1", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVidio(url: url)
    }
    
    @IBAction func btnNetworkMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")
        playVidio(url: url!)
        
    }
    
    func playVidio(url: NSURL){
        let playController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playController.player = player
        
        self.present(playController, animated: true){
            player.play()
        }
    }
    
}

