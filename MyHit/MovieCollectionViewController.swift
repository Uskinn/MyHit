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
    
    let posters = [UIImage(named: "1.JPG"), UIImage(named: "2.JPG"), UIImage(named: "3.JPG")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OMDBAPIClient.getMoviesWithComplition { (responseData) in
            
            
            
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posters.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.movieCollectionImage.image = self.posters[indexPath.row]
        
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
                
                // print(self.posters[indexPath.row])
                
                // destinationVC.poster = self.posters[indexPath.row]
                
            } else {
                print("error" )
            }
        }
    }
}

