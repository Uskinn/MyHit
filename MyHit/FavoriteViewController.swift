//
//  FavoriteViewController.swift
//  MyHit
//
//  Created by Sergey Nevzorov on 9/25/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UITableViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let dataStore = DataStore.sharedDataStore
    
    let favoriteMovie = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OMDBAPIClient.getMovies { (movie) in print(movie) }
        self.tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteMovie.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! CustomCell
        
        NSOperationQueue.mainQueue().addOperationWithBlock { 
            
            OMDBAPIClient.getMovies({ (movie) in
                
                cell.year = movie.
                
            })
            
            
        }
        
        
        return cell
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
