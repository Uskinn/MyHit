//
//  OMDBAPIClient.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import CoreData

class OMDBAPIClient: NSObject {
    
    class func getMovies(completion: ([Movie] -> Void)) {
        loadAndSaveMovies {
            let moc = DataStore.sharedDataStore.managedObjectContext
            let movieFetch = NSFetchRequest(entityName: String(ManagedMovie))
            do {
                let fetchMovies = try moc.executeFetchRequest(movieFetch) as! [ManagedMovie]
                print("fetchMovies: \(fetchMovies)\ncount: \(fetchMovies.count)")
                let movies = fetchMovies.map {(managedMovie: ManagedMovie) -> Movie in
                    var movie = Movie()
                    movie.title = managedMovie.title
                    movie.poster = managedMovie.poster
                    movie.year = managedMovie.year
                    movie.actors = managedMovie.actors
                    movie.director = managedMovie.director
                    movie.plot = managedMovie.plot
                    movie.imdbRating = managedMovie.imdbRating
                    movie.metaScore = managedMovie.metaScore
                    movie.writer = managedMovie.writer
                    movie.genre = managedMovie.genre
                    movie.imdbID = managedMovie.imdbID
                    
                    return movie
                }
                completion(movies)
            } catch {
                print(error)
            }
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
    
    class func saveManagedMovie(movie: NSDictionary) {
        let managedObjectContext = DataStore.sharedDataStore.managedObjectContext
        let managedMovie = NSEntityDescription.insertNewObjectForEntityForName(
            String(ManagedMovie), inManagedObjectContext: managedObjectContext) as! ManagedMovie
        if let dictionary = movie as? [String: AnyObject] {
            managedMovie.title = dictionary["Title"] as? String
            managedMovie.poster = dictionary["Poster"] as? String
            managedMovie.year = dictionary["Year"] as? String
            managedMovie.actors = dictionary["Actors"] as? String
            managedMovie.director = dictionary["Director"] as? String
            managedMovie.plot = dictionary["Plot"] as? String
            managedMovie.imdbRating = dictionary["imdbRating"] as? String
            managedMovie.metaScore = dictionary["Metascore"] as? String
            managedMovie.writer = dictionary["Writer"] as? String
            managedMovie.genre = dictionary["Genre"] as? String
            managedMovie.imdbID = dictionary["imdbID"] as? String
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("Error occured\(error)")
        }
    }
    
    class func loadAndSaveMovies(completion: () -> Void) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        if let  omdbURL = NSURL(string: "http://www.omdbapi.com/?s=love&y=&plot=short&r=json") {
            let omdbTask = session.dataTaskWithURL(omdbURL, completionHandler: { (data, response, error ) in
                if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                        
                        let moviesDictArray = responseData["Search"] as! [NSDictionary]
                        
                        for movieDict in moviesDictArray {
                            
                            self.saveManagedMovie(movieDict)
                        }
                        completion()
                    }  catch {
                        print(error)
                    }
                }
            })
            omdbTask.resume()
        }
    }
}














