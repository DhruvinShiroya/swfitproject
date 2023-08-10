//
//  MovieTableViewCell.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-09.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
