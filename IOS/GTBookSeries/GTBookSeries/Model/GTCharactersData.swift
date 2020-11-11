//
//  Characters.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import Foundation


// MARK: - GTCharacters
class GTCharactersData : Codable {
    let url: String
    let name, gender, culture, born: String
    let died: String
    let titles, aliases: [String]
    let father, mother, spouse: String
    let allegiances, books, povBooks: [String]
    let tvSeries, playedBy: [String]

    enum CodingKeys: String, CodingKey {
             case url
             case name = "name"
             case gender = "gender"
             case culture = "culture"
             case born = "born"
             case died = "died"
             case titles = "titles"
             case aliases = "aliases"
             case father = "father"
             case mother = "mother"
             case spouse = "spouse"
             case allegiances = "allegiances"
             case books = "books"
             case povBooks = "povBooks"
             case tvSeries = "tvSeries"
             case playedBy = "playedBy"
    }
    
}
