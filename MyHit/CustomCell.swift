//
//  CustomCell.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/25/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var year: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
