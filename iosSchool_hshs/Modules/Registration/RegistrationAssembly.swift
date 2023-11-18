//
//  RegistrationAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC() -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator() -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC() -> RegistrationViewController<RegistrationViewImp> {
        .init(registrationDataProvider: registrationDataProvider())
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp()
    }

    func registrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(assemlby: self, context: .init())
    }
}
