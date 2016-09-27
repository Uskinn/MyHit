//
//  ManagedMovie+CoreDataProperties.swift
//  
//
//  Created by Sergey Nevzorov on 9/27/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ManagedMovie {

    @NSManaged var actors: String?
    @NSManaged var director: String?
    @NSManaged var genre: String?
    @NSManaged var imdbID: String?
    @NSManaged var imdbRating: String?
    @NSManaged var metaScore: String?
    @NSManaged var plot: String?
    @NSManaged var poster: String?
    @NSManaged var title: String?
    @NSManaged var writer: String?
    @NSManaged var year: String?
    @NSManaged var isFavorite: Bool

}
