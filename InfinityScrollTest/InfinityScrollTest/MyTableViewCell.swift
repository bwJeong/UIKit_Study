//
//  MyTableViewCell.swift
//  InfinityScrollTest
//
//  Created by Byungwook Jeong on 2021/07/14.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
