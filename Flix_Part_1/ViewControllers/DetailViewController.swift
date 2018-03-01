//
//  DetailViewController.swift
//  Flix_Part_1
//
//  Created by Kevin Nguyen on 2/6/18.
//  Copyright © 2018 KevinVuNguyen. All rights reserved.
//

import UIKit

enum movieKeys{
    static let title = "title"
    static let release_date = "release_date"
    static let overView = "overview"
    static let backdropPath = "backdrop_path"
    static let posterPath  = "poster_path"
}

class DetailViewController: UIViewController {

    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDateString
            overViewLabel.text = movie.description
            let backdropPathString = movie.backDropString
            let posterPathString = movie.posterString
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backDropURL = URL(string: baseURLString + backdropPathString!)!
            backDropImageView.af_setImage(withURL: backDropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString!)!
            
            posterImageView.af_setImage(withURL: posterPathURL)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
