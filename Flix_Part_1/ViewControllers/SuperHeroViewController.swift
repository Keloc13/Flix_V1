//
//  SuperHeroViewController.swift
//  Flix_Part_1
//
//  Created by Kevin Nguyen on 2/6/18.
//  Copyright © 2018 KevinVuNguyen. All rights reserved.
//

import UIKit

class SuperHeroViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {

    var movies:[Movie] = []
    var filterMovies: [Movie] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        searchBar.delegate = self
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Reached inside collection view cellForItemAt")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! PosterCell
        print(indexPath.item)
   
        let movie = filterMovies[indexPath.item]
        if  let posterPathString = movie.posterString {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterImage.af_setImage(withURL: posterURL)
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
            let movie = filterMovies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchMovies() {
        print("inside fetchMovies")
        MovieApiManager().nowPlayingMovies{(movie: [Movie]?, error: Error?) in if let movies = movie{
                print("Size of API movie", movies.count)
                self.movies = movies
                self.filterMovies = movies
                self.collectionView.reloadData()
            }
        }
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
       filterMovies = searchText.isEmpty ? movies : movies.filter { (item: Movie) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.title?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        collectionView.reloadData()
    }
}
