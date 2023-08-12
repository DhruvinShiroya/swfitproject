//
//  MovieDetail+CoreDataProperties.swift
//  moviesflix
//
//  Created by harman on 2023-08-07.
//
//

import Foundation
import CoreData


extension MovieDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDetail> {
        return NSFetchRequest<MovieDetail>(entityName: "MovieDetail")
    }

    @NSManaged public var id: String?
    @NSManaged public var crew: String?

}

extension MovieDetail : Identifiable {

}
