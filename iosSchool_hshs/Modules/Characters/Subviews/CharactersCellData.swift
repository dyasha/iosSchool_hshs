//
//  CharactersCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 07.12.2023.
//

import UIKit

struct CharactersCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let url: String
    let isLoading: Bool
    let name: String?
    let genderSpecies: String?
    let imageUrl: String?
    let image: UIImage?
    let episodes: [String]

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        self.isLoading = isLoading
        name = character.name
        genderSpecies = character.gender.rawValue + " " + character.species
        imageUrl = character.image
        self.image = image
        self.selectClosure = selectClosure
        episodes = character.episode
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        genderSpecies = nil
        imageUrl = nil
        image = nil
        episodes = []
    }
}
