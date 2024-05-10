//
//  DetailViewController.swift
//  colection_view
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblresult: UILabel!
    
    var result = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblresult.text = result
        // Do any additional setup after loading the view.
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
