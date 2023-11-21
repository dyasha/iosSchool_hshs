//
//  CharactersAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import Foundation

protocol CharactersAssembly {
    func charactersVC() -> CharactersViewController
    func charactersDataProvider() -> CharactersDataProvider
    func charactersCoordinator() -> CharactersCoordinator
}

extension Assembly: CharactersAssembly {
    func charactersVC() -> CharactersViewController {
        .init(charactersDataProvider: charactersDataProvider())
    }

    func charactersDataProvider() -> CharactersDataProvider {
        CharactersDataProviderImp(characterApiClient: apiClient)
    }

    func charactersCoordinator() -> CharactersCoordinator {
        CharactersCoordinator(assemlby: self, context: .init())
    }
}
