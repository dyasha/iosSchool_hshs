//
//  RegistrationApiClient.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration (
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration (
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let dataToJSON = try? JSONSerialization.data(withJSONObject: ["username": username, "password": password])
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register"
        performRequest(url: url, data: dataToJSON, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
