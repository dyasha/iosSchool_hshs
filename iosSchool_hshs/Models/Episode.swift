//
//  Episode.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 17.12.2023.
//

import Foundation

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
    }
}
