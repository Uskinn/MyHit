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
    var poster = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.moviePosterImage.image = self.poster
        
    }

}
