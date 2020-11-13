//
//  Books.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import Foundation

 // MARK: - GTBooks
 struct GTBooksData : Codable {
     let url: String
     let name, isbn: String
     let authors: [String]
     let numberOfPages: Int
     let publisher, country, mediaType, released: String
     let characters, povCharacters: [String]

    enum CodingKeys: String, CodingKey {
            case url
            case name = "name"
            case isbn = "isbn"
            case authors = "authors"
            case numberOfPages = "numberOfPages"
            case publisher = "publisher"
            case country = "country"
            case mediaType = "mediaType"
            case released = "released"
            case characters = "characters"
            case povCharacters = "povCharacters"
        
    }
    
 }

