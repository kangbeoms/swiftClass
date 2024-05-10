//
//  ViewController.swift
//  sendMessage
//
//  Created by TJ on 2024/04/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvList: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblcheck: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvList.isEditable = false
    }
    enum imojiList{
        case happy
        case sad
        
        func Go() ->String {
            switch self{
            case.happy:
                return "🤩"
            case.sad:
                return "😭"
            }
        }
    }
    @IBAction func btnsend(_ : UIButton) {
        guard let tf = tfMessage.text else {return}
        if ( tf.isEmpty) {
            lblcheck.text = "메세지를 입력해"
        }else{
            tvList.text += "\(tf)\n"
            tfMessage.text = ""
        }
    }
    @IBAction func btnimoji(_ sender: UIButton) {
        tfMessage.text! += imojiList.happy.Go()
    }
}

