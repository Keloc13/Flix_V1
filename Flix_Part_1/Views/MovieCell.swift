//
//  MovieCell.swift
//  Flix_Part_1
//
//  Created by Kevin Nguyen on 2/4/18.
//  Copyright © 2018 KevinVuNguyen. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie! {
        didSet {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + movie.posterString!)!
            posterImageView.af_setImage(withURL: posterURL)
            titleLabel.text = movie.title
            overviewLabel.text = movie.description
        }
    }
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
       
    }//when the parent change the dimension, this happens.
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
