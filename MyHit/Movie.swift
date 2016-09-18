//
//  Movie.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import Foundation

struct Movie {
    
    var title: String = ""
    var releaseDate: Int = 0
    var director: String = ""
    var writer: String = ""
    var stars: [String] = []
    var imdbScore: Double = 0.0
    var metaScore: Double = 0.0
    var plot: String = ""
    var poster: String = ""
    
    static func mapFromDictionary(movieDictionary: NSDictionary) -> Movie {
        
        var movie = Movie()
        
        if let dictionary = movieDictionary as? [String: AnyObject] {
            
            movie.title = dictionary["Title"] as! String
            movie.poster = dictionary["Poster"] as! String
        
        }
        return movie
    }
    
    
    
}













