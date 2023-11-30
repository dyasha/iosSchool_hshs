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
        let locationVC = assembly.locationsVC()
//        locationVC.selectLocation = { [weak locationVC] locationData in
//            let coordinator = self.assembly.charactersCoordinator(viewModel: locationVC)
//                guard let characterVC = coordinator.make() else {
//                    return
//                }
//                locationVC?.navigationController?.pushViewController(characterVC, animated: true)
//        }
        return locationVC
    }
}
