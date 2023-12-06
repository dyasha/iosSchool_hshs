//
//  AppCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import Foundation
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: coordinator.make())
    }

    private func authBootstrap() {
        guard assembly.storageManager.getToken() == nil else {
            assembly.storageManager.saveLastLoginDate()
            setTabVC()
            return
        }
        let authCoordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.assembly.storageManager.saveLastLoginDate()
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func setTabVC() {
        print(assembly.storageManager.getLastLoginDate() ?? 0)
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationsCoordinator()
//        let cabinetCoord = assembly.cabinetCoodrinator()
        guard let locationsVC = locationsCoord.make() else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = RootTab.locations.tabBarItem

//        cabinetVC.tabBarItem = RootTab.cabinet.tabBarItem
        tabVC.setViewControllers([navVC], animated: false)
        setRoot(viewController: tabVC)
        }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
