//
//  TableViewCell.swift
//  JSON imageTable
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewList: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
