//
//  CategoryViewCell.swift
//  E Store
//
//  Created by Bayu Yasaputro on 14/10/23.
//

import UIKit

class CategoryViewCell: UITableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        thumbImageView.layer.cornerRadius = 4
        thumbImageView.layer.masksToBounds = true
    }

}
