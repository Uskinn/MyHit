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
    //var poster: UIImage!
    var movieModel: Movie?
    var movieTitle: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let poster = movieModel?.poster {
        
            if let url = NSURL(string: poster) {
    
                moviePosterImage.sd_setImageWithURL(url)
                
            }
        }
        
        if let title = movieTitle?.title {
            titleLabel.text = title
        }

    }
    
    
}
