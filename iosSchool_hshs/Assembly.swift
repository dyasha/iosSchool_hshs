//
//  Assembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 26.10.2023.
//

import UIKit

class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }

    func coloerGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assemlby: self, context: .init())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
