//
//  CharactersAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import Foundation

protocol CharactersAssembly {
    func charactersVC(data: LocationsCellData) -> CharactersViewController<CharactersViewImp>
    func charactersDataProvider() -> CharactersDataProvider
    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator
}

extension Assembly: CharactersAssembly {
    func charactersVC(data: LocationsCellData) -> CharactersViewController<CharactersViewImp> {
        .init(charactersDataProvider: charactersDataProvider(), data: data, imageService: imageService)
    }

    func charactersDataProvider() -> CharactersDataProvider {
        CharactersDataProviderImp(characterApiClient: apiClient)
    }

    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator {
        CharactersCoordinator(assembly: self, context: .init(data: data))
    }
}
