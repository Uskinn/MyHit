//
//  MovieDetailViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/10/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import SDWebImage


class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    
    var movieModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                
        
            })
        }
    }
}
