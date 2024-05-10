//
//  DetailViewController.swift
//  collectionView_Quiz
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class DetailViewController: UIViewController {

    var whatImage = ""
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: whatImage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
