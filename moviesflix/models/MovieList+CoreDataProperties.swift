//
//  MovieList+CoreDataProperties.swift
//  moviesflix
//
//  Created by harman on 2023-08-07.
//
//

import Foundation
import CoreData


extension MovieList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieList> {
        return NSFetchRequest<MovieList>(entityName: "MovieList")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var wishlist: Bool
    @NSManaged public var watched: Bool
    @NSManaged public var id: String?
    @NSManaged public var movieDetails: MovieDetail?

}

extension MovieList : Identifiable {

}
