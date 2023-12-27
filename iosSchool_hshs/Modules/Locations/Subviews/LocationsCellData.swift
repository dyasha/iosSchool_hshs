//
//  LocationsCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 27.11.2023.
//

import Foundation

struct LocationsCellData {
    let name: String
    let type: String
    let residents: [String]
    let population: String

    init(locations: Location) {
        name = locations.name
        type = locations.type
        residents = locations.residents
        population = "Население: " + String(residents.count)
    }
}
