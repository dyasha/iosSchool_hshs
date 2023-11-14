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
    let dim: String
    let residents: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dim = "dimention"
        case residents
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.residents = (try? container.decode([String].self, forKey: .residents)) ?? []
        self.dim = try container.decode(String.self, forKey: .dim)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

    }

}
