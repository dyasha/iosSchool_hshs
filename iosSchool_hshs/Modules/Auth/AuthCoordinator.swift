//
//  AuthCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {
    struct Context {
        let onOpenLogin: (() -> Void)?
    }

    override func make() -> UIViewController? {
        let controller = assembly.authVC(onOpenLogin: context.onOpenLogin)
        controller.onOpenRegistration = { [weak controller] in
            let coordinator = self.assembly.registrationCoordinator(onRegistrationSuccess: self.context.onOpenLogin)
            guard let registrationVC = coordinator.make() else {
                return
            }
            registrationVC.modalPresentationStyle = .fullScreen
            controller?.present(registrationVC, animated: true)
        }
        return controller
    }
}
