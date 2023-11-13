//
//  SplashAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 09.11.2023.
//

import UIKit

protocol SplashAssembly {
    func splashCoordinator(onSucces: (() -> Void)?) -> SplashCoordinator
    func splashVC(onSucces: (() -> Void)?) -> SplashViewController
    func splashDataProvider() -> SplashDataProvider

}

extension Assembly: SplashAssembly {

    func splashCoordinator(onSucces: (() -> Void)?) -> SplashCoordinator {
        SplashCoordinator(assemlby: self, context: .init(onSuccess: onSucces))
    }

    func splashVC(onSucces: (() -> Void)?) -> SplashViewController {
        .init(dataProvider: splashDataProvider(), onSuccess: onSucces)
    }

    func splashDataProvider() -> SplashDataProvider {
        SplashDataProviderImp()
    }
}
