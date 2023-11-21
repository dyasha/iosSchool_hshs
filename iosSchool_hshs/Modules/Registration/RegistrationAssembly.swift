//
//  RegistrationAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController {
        .init(registrationDataProvider: registrationDataProvider(), onRegistrationSuccess: onRegistrationSuccess)
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(registrationApiClient: apiClient)
    }

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assemlby: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }
}
