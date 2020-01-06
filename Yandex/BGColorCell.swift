//
//  BGColorCell.swift
//  Yandex
//
//  Created by Mac on 05/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BGColorCell: UITableViewCell {
    @IBOutlet weak var colorLbl: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
