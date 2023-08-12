//
//  Result.swift
//  moviesflix
//
//  Created by dhruvin on 2023-08-08.
//

import Foundation

class Result:Codable {
    var primaryImage :Image?
    var titleType :TitleType?
    var originalTitleText : Title?
    var releaseDate : ReleaseDate?
}
