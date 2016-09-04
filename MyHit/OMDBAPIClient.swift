//
//  OMDBAPIClient.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class OMDBAPIClient: NSObject {
    
    class func getMoviesWithComplition(complitionHandler: (NSDictionary) -> ()) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        //typed my url in browser
        if let OMDBURL = NSURL(string: "http://www.omdbapi.com/?t=taxi&y=&plot=full&r=json") {
            
            // let's get the task going
            let OMDBTask = session.dataTaskWithURL(OMDBURL, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                        
                        complitionHandler(responseData)
                    } catch {
                        print("Error: \(error)")
                    }
                }
            })
            // we pressed enter in browser
            OMDBTask.resume()
        }
        
    }
}
