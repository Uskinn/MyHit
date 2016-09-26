//
//  MovieDetailViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/10/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import SDWebImage
import FontAwesome_swift
import CoreData


class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var starButtonOutlet: UIBarButtonItem!
    
    var movieModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(30)] as Dictionary!
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes(attributes, forState: .Normal)
        self.navigationItem.rightBarButtonItem!.title = String.fontAwesomeIconWithName(.Star)
        self.navigationItem.rightBarButtonItem!.tintColor = UIColor.blueColor()
        
        guard let movieId = self.movieModel?.imdbID else {return}
        
        OMDBAPIClient.getMovieWithCompletion(movieId) { movie in
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                
                
                self.plotLabel.text = movie?.plot
                self.titleLabel.text = movie?.title
                self.yearLabel.text = movie?.year
                if let poster = self.movieModel?.poster {
                    if let url = NSURL(string: poster) {
                        self.moviePosterImage.sd_setImageWithURL(url)
                    }
                }
                self.navigationItem.title = movie?.title
                
                
            })
        }
    }
    @IBAction func starButtonTapped(sender: AnyObject) {
        
                
        if self.navigationItem.rightBarButtonItem!.tintColor == UIColor.blueColor() {
            self.navigationItem.rightBarButtonItem!.tintColor = UIColor.orangeColor()
        } else if self.navigationItem.rightBarButtonItem!.tintColor == UIColor.orangeColor() {
            self.navigationItem.rightBarButtonItem!.tintColor = UIColor.blueColor()
        }
    }
}
