//
//  CharacterApiClient.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import Foundation

protocol CharacterApiClient {
    func getCharacter(
        id: Int,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

extension ApiClient: CharacterApiClient {
    func getCharacter(id: Int, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.characterURL + "/\(String(id))"
        performRequest(url: url, data: nil, method: .get) { (result: Result<Character, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
