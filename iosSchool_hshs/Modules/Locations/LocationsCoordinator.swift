//
//  LocationsCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import UIKit

class LocationsCoordinator: BaseCoordinator<LocationsCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.locationsVC()
    }
}
