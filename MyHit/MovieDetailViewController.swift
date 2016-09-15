//
//  MovieDetailViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/10/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    //var poster: UIImage!
    var movieModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let poster = movieModel?.poster {
            
            if let url = NSURL(string: poster) {
                
                if let data = NSData(contentsOfURL: url) {
                    
                    moviePosterImage.image = UIImage(data: data)
                }
            }
        }
    }
    
}
