//
//  Assembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 26.10.2023.
//

import UIKit

class Assembly {
    lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)
    lazy var storageManager: StorageManager = StorageManagerImp()
    lazy var dateFormatter: DateFormatterManager = DateFormatterManagerImp()

    var apiClient: ApiClient {
        ApiClient()
    }

    func coloerGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: .init())
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
