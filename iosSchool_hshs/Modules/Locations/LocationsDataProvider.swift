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
    private let locationsApiClient: LocationsApiClient

    init(locationsApiClient: LocationsApiClient) {
        self.locationsApiClient = locationsApiClient
    }

    func getLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        locationsApiClient.getLocations(onRequestCompleted: onRequestCompleted)
    }
}
