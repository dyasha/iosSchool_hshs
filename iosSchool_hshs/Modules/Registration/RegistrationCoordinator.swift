//
//  RegistrationCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {
    struct Context {
        var onRegistrationSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        let controller = assembly.registrationVC(onRegistrationSuccess: context.onRegistrationSuccess)
//       controller.onRegistrationSuccess = { [weak controller] in
//           let coordinator = self.assembly.locationsCoordinator()
//           guard let locationVC = coordinator.make() else {
//               return
//           }
//           controller?.present(locationVC, animated: true)
//        }
        return controller
    }
}
