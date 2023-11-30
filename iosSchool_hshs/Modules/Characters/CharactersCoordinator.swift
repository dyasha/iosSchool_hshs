//
//  CharactersCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import UIKit

class CharactersCoordinator: BaseCoordinator<CharactersCoordinator.Context> {
    struct Context {
        let data: LocationsCellData
    }

    override func make() -> UIViewController? {
        assembly.charactersVC(data: context.data)
    }
}
