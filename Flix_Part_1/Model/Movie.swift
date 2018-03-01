//
//  Movie.swift
//  Flix_Part_1
//
//  Created by Kevin Nguyen on 2/28/18.
//  Copyright © 2018 KevinVuNguyen. All rights reserved.
//

import Foundation

class Movie{
    var title: String?
    var posterUrl: URL?
    var description: String?
    let baseURLString = "https://image.tmdb.org/t/p/w500"
    let posterString: String?
    let releaseDateString: String?
    let backDropString: String?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        posterString = dictionary["poster_path"] as? String ?? "No poster url path"
        description = dictionary["overview"] as? String ?? "No description"
        posterUrl = URL(string: baseURLString + posterString! )
        releaseDateString = dictionary[movieKeys.release_date] as? String ?? "No releaseDate"
        backDropString = dictionary[movieKeys.backdropPath] as? String ?? "No backdrop String"
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
