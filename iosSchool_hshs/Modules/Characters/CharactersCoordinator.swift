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
        let controller = assembly.charactersVC(data: context.data)
        controller.selectCharacter = { [weak controller] locationData in
            let coordinator = self.assembly.personCoordinator(data: locationData)
            guard let characterVC = coordinator.make() else {
                return
            }
            controller?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return controller
    }
}
