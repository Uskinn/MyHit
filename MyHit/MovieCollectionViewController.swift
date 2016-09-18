//
//  FirstViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class MovieCollectioViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movies = [Movie]()
    var movieModal: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OMDBAPIClient.getMovies { (movies) in
            print(movies)
            self.movies = movies
            self.movieCollectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let movie = movies[indexPath.row]
        if let poster = NSURL(string: movie.poster) {
            cell.movieCollectionImage.sd_setImageWithURL(poster)
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
                
                destinationVC.movieModel = self.movieModal
                destinationVC.movieTitle = self.movieModal
                
                
            } else {
                print("error" )
            }
        }
    }
}

