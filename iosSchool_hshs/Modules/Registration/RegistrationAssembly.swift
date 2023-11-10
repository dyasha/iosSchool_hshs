//
//  RegistrationAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC() -> RegistrationViewController
    func dataProvider() -> RegistrationDataProvider
    func registrationCoordinator() -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC() -> RegistrationViewController {
        .init(dataProvider: dataProvider())
    }

    func dataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp()
    }

    func registrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(assemlby: self, context: .init())
    }
}