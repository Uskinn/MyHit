//
//  OMDBAPIClient.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/4/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class OMDBAPIClient: NSObject {
    //1
    class func getMoviesWithComplition(complitionHandler: (NSDictionary) -> ()) {
        //2
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        //3
        if let OMDBURL = NSURL(string: "http://www.omdbapi.com/?t=taxi&y=&plot=full&r=json") {
            //4
            let OMDBTask = session.dataTaskWithURL(OMDBURL, completionHandler: { (data, response, error) in
                //5
                if let data = data {
                    do {
                        //6
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                            as! NSDictionary
                        //7
                        NSOperationQueue.mainQueue().addOperationWithBlock({
                            complitionHandler(responseData)
                            print(responseData)
                        })
                        //8
                    } catch {
                        print("Error: \(error)")
                    }
                }
            })
            //9
            OMDBTask.resume()
        }
    }
}
