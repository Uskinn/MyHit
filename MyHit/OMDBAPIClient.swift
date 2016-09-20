//
//  OMDBAPIClient.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class OMDBAPIClient: NSObject {
    
//    class func getMovieWithComplition(complitionHandler: (Movie) -> ()) {
//        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        
//        if let OMDBURL = NSURL(string: "http://www.omdbapi.com/?t=taxi&y=&plot=full&r=json" ) {
//            
//            let OMDBTask = session.dataTaskWithURL(OMDBURL, completionHandler: { (data, response, error) in
//                
//                if let data = data {
//                    do {
//                        
//                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [])
//                            as! NSDictionary
//                        
//                        NSOperationQueue.mainQueue().addOperationWithBlock({
//                            
//                            let movie = Movie.mapFromDictionary(responseData)
//                            
//                            complitionHandler(movie)
//                            print(responseData)
//                        })
//                        
//                    } catch {
//                        print("Error: \(error)")
//                    }
//                }
//            })
//            
//            OMDBTask.resume()
//        }
//    }
    
    class func getMovies(completion: ([Movie] -> Void)) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let  omdbURL = NSURL(string: "http://www.omdbapi.com/?s=taxi&page=2") {
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
}














