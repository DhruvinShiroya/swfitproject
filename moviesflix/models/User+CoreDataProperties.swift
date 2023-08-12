//
//  User+CoreDataProperties.swift
//  moviesflix
//
//  Created by harman on 2023-08-07.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var movieList: NSSet?

}

// MARK: Generated accessors for movieList
extension User {

    @objc(addMovieListObject:)
    @NSManaged public func addToMovieList(_ value: MovieList)

    @objc(removeMovieListObject:)
    @NSManaged public func removeFromMovieList(_ value: MovieList)

    @objc(addMovieList:)
    @NSManaged public func addToMovieList(_ values: NSSet)

    @objc(removeMovieList:)
    @NSManaged public func removeFromMovieList(_ values: NSSet)

}

extension User : Identifiable {

}
