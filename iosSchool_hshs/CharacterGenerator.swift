//
//  CharacterGenerator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 25.10.2023.
//

import Foundation

struct Location {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

struct LocationList {
    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?

    }

    let info: Info
    let results: [Location]
}

class Character {
    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }

    enum Status: String, CaseIterable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    init(
        id: Int,
        name: String,
        species: String,
        image: String,
        url: String,
        episode: [String],
        gender: Gender,
        status: Status
    ) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }

    func characterInfo() -> String {
        let statusDescription: String
        let genderDescription: String

        switch gender {
        case .female:
            genderDescription = "девушкой"
        case .male:
            genderDescription = "мужчиной"
        case .genderless:
            genderDescription = "бесполым"
        case .unknown:
            genderDescription = "не понятно кем"
        }

        switch status {
        case .alive:
            statusDescription = "к счастью этот персонаж жив!"
        case .dead:
            statusDescription = "к сожалению этот персонаж мертв =("
        case .unknown:
            statusDescription = "статус этого персонажа неизвестен."
        }

        return "\(name) \(species) является \(genderDescription) и \(statusDescription)"
    }
}

protocol CharacterGeneratorProtocol {
    var genderForName: [String: Character.Gender] { get }
    var species: [String] { get }

    func generate() -> Character
}

class CharacterGenerator: CharacterGeneratorProtocol {
    let genderForName: [String: Character.Gender] = [
            "Ivan": .male,
            "Anton": .male,
            "Egor": .male,
            "Anna": .female,
            "Sveta": .female,
            "Katya": .female
    ]

    let species: [String] = [
        "Human",
        "Dwarf",
        "Dragonborn",
        "Elf"
    ]

    func generate() -> Character {
        let name = nameGenerator()
        return Character(
            id: idGenerator(),
            name: name,
            species: speciesGenerator(),
            image: "Not image now.",
            url: "Not URL now",
            episode: ["1", "2"],
            gender: genderGenerator(name: name),
            status: statusGenerator()
        )
    }

   private func idGenerator() -> Int {
        return Int.random(in: 1...100)
    }

    private func nameGenerator() -> String {
        return genderForName.keys.randomElement() ?? "nameError"
    }

    private func speciesGenerator() -> String {
        return species.randomElement() ?? "speciesError"
    }

    private func genderGenerator(name: String) -> Character.Gender {
        guard Bool.random() else {
            return Character.Gender.allCases.randomElement() ?? .unknown
        }
        return genderForName[name] ?? .unknown
    }

    private func statusGenerator() -> Character.Status {
        return Character.Status.allCases.randomElement() ?? .unknown
    }

}
