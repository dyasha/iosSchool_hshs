//
//  RegistrationDataProvider.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import Foundation

protocol RegistrationDataProvider {

    func registration (
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

class RegistrationDataProviderImp: RegistrationDataProvider {

    private let registrationApiClient: RegistrationApiClient

    init(registrationApiClient: RegistrationApiClient) {
        self.registrationApiClient = registrationApiClient
    }

    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        registrationApiClient.registration(
            username: username,
            password: password,
            onRequestCompleted: onRequestCompleted
        )
    }
}
