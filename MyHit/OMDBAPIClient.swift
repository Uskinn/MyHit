//
//  OMDBAPIClient.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class OMDBAPIClient: NSObject {
    
    class func getMovies(completion: ([Movie] -> Void)) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let  omdbURL = NSURL(string: "http://www.omdbapi.com/?s=love&y=&plot=short&r=json") {
            let omdbTask = session.dataTaskWithURL(omdbURL, completionHandler: { (data, response, error ) in
                if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                        
                        // NSOperationQueue.mainQueue().addOperationWithBlock({
                        
                        let moviesDictArray = responseData["Search"] as! [NSDictionary]
                        
                        var moviesCollection : [Movie] = []
                        
                        for movieDict in moviesDictArray {
                            let movie = Movie.mapFromDictionary(movieDict)
                            moviesCollection.append(movie)
                        }
                        completion(moviesCollection)
                        //})
                        
                    }  catch {
                        print(error)
                    }
                }
            })
            omdbTask.resume()
        }
    }
    
    class func getMovieWithCompletion(imdbID: String, completion: (Movie?) -> Void) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let omdbUrl = NSURL(string: "http://www.omdbapi.com/?i=\(imdbID)&plot=short&r=json") {
            
            let omdbTask = session.dataTaskWithURL(omdbUrl, completionHandler: { (data, response, error) in
                
                if let data = data {
                    do {
                        
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                            as! NSDictionary
                        
                        let movie = Movie.mapFromDictionary(responseData)
                        
                        completion(movie)
                        
                    } catch {
                        print("Error: \(error)")
                    }
                }
            })
            
            omdbTask.resume()
        }
    }
}














