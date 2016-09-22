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
        
        if let  omdbURL = NSURL(string: "http://www.omdbapi.com/?s=taxi&y=&plot=short&r=json") {
            let omdbTask = session.dataTaskWithURL(omdbURL, completionHandler: { (data, response, error ) in
                if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({
                            
                            let moviesDictArray = responseData["Search"] as! [NSDictionary]
                            
                            var moviesCollection : [Movie] = []
                            
                            for movieDict in moviesDictArray {
                                let movie = Movie.mapFromDictionary(movieDict)
                                moviesCollection.append(movie)
                            }
                            completion(moviesCollection)
                        })
                        
                    }  catch {
                        print(error)
                    }
                }
            })
            omdbTask.resume()
        }
    }
    
    class func getMovieWithComplition(movieID: Movie, completion: (Movie) -> Void) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let OMDBURL = NSURL(string: "http://www.omdbapi.com/?i=tt0152930&plot=short&r=json") {
            
            let OMDBTask = session.dataTaskWithURL(OMDBURL, completionHandler: { (data, response, error) in
                
                if let data = data {
                    do {
                        
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                            as! NSDictionary
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({
                            
                            let title = responseData["Title"] as! NSDictionary
                            
                            let movie = Movie.mapFromDictionary(title)
                        
                            
                            completion(movie)
                            print(responseData)
                        })
                        
                    } catch {
                        print("Error: \(error)")
                    }
                }
            })
            
            OMDBTask.resume()
        }
    }
}














