//
//  AuthAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC(onOpenLogin: (() -> Void)?) -> AuthViewController<AuthViewImp>
    func dataProvider() -> AuthDataProvider
    func authCoordinator(onOpenLogin: (() -> Void)?) -> AuthCoordinator
}

extension Assembly: AuthAssembly {
    func authVC(onOpenLogin: (() -> Void)?) -> AuthViewController<AuthViewImp> {
        .init(dataProvider: dataProvider(), storageManager: storageManager, onOpenLogin: onOpenLogin)
    }

    func dataProvider() -> AuthDataProvider {
        AuthDataProviderImp(apiClient: apiClient)
    }

    func authCoordinator(onOpenLogin: (() -> Void)?) -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init(onOpenLogin: onOpenLogin))
    }
}
