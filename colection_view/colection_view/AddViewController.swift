//
//  AddViewController.swift
//  colection_view
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfman: UITextField!
    
    var 프로토콜: SaveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAct_Insert(_ sender: UIButton) {
        guard let text = tfman.text else {return}
        프로토콜?.InsertData(self, result: text)
        navigationController?.popViewController(animated: true)
        
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
