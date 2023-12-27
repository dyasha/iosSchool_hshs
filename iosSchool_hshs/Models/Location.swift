//
//  Locations.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 13.11.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
