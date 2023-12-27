//
//  PersonCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 13.12.2023.
//

import UIKit

class PersonCoordinator: BaseCoordinator<PersonCoordinator.Context> {
    struct Context {
        let data: CharactersCellData
    }

    override func make() -> UIViewController? {
        assembly.personVC(data: context.data)
    }
}
