//
//  RegistrationCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.registrationVC()
    }
}
