//
//  LocationsDataProvider.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import Foundation

protocol LocationsDataProvider {
    func getLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationsDataProviderImp: LocationsDataProvider {
    private let apiClient: LocationsApiClient

    init(apiClient: LocationsApiClient) {
        self.apiClient = apiClient
    }

    func getLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.getLocations(onRequestCompleted: onRequestCompleted)
    }
}
