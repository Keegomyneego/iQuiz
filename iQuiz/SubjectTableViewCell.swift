//
//  SubjectTableViewCell.swift
//  iQuiz
//
//  Created by Keegs on 11/3/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        self.contentView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        self.sizeToFit()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
