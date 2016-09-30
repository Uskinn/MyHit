//
//  FirstViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class MovieCollectioViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieSearchBar: UISearchBar!
    var moviesArray = [Movie]()
    var movieModalCollectionView: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSearchBar()
        
        OMDBAPIClient.getMovies { (movies) in
            //print(movies)
            self.moviesArray = movies
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.movieCollectionView.reloadData()
            })
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let movie = moviesArray[indexPath.row]
        
        if let moviePoster = movie.poster {
            if let poster = NSURL(string: moviePoster) {
                cell.movieCollectionImage.sd_setImageWithURL(poster)
            } else {
                print("error occured")
            }
        }
            return cell
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showMovie", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMovie" {
            
            if let indexPaths = self.movieCollectionView?.indexPathsForSelectedItems() {
                let indexPath = indexPaths[0] as NSIndexPath
                
                let destinationVC = segue.destinationViewController as! MovieDetailViewController
                
                destinationVC.movieModel = self.moviesArray[indexPath.row]
                
            } else {
                print("error" )
            }
        }
    }
    
    private func addSearchBar() {
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        movieSearchBar = UISearchBar()
        movieSearchBar.delegate = self
        movieSearchBar.frame = CGRect(x: 20, y: 0, width: screenWidth * 0.9, height: 44)
        
        self.navigationController?.navigationBar.addSubview(movieSearchBar)
    }
}

