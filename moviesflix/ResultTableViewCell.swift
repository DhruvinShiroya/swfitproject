//
//  ResultTableViewCell.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-08.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblMovieName :UILabel?
    @IBOutlet weak var lblYear :UILabel?
    @IBOutlet weak var btnWatched : UIButton?
    @IBOutlet weak var btnWatchList :UIButton?
    @IBOutlet weak var movieImage : UIImageView?
    @IBOutlet weak var imgUrl: UILabel?
    var watchButtonTapped : (() -> Void)?
    
    var watchListButtonTapped : (() -> Void)?
    
    
    @IBAction func watchButtonTapped (_ sender: UIButton){
        watchButtonTapped?()
    }

    
    @IBAction func watchListButtonTapped (_ sender: UIButton){
        watchListButtonTapped?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
