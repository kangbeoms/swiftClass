//
//  ViewController.swift
//  Server_Image
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button2(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog2.jpg")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
        
    }
    
    @IBAction func button1(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let Session = Foundation.URLSession(configuration: .default)
        
        let task = Session.dataTask(with: url!){(data, response, error) in
            
            if error != nil{
                print("Failed to download data")
            }else{
                print("download")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
}


