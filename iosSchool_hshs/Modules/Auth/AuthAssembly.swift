//
//  AuthAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC() -> AuthViewController<AuthViewImp>
    func dataProvider() -> AuthDataProvider
    func authCoordinator() -> AuthCoordinator
}

extension Assembly: AuthAssembly {
    func authVC() -> AuthViewController<AuthViewImp> {
        .init(dataProvider: dataProvider())
    }

    func dataProvider() -> AuthDataProvider {
        AuthDataProviderImp(apiClient: apiClient)
    }

    func authCoordinator() -> AuthCoordinator {
        AuthCoordinator(assemlby: self, context: .init())
    }
}
