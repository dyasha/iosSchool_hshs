//
//  Character.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: String
    let status: String
}
