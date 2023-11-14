//
//  LocationsAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import Foundation

protocol LocationsAssembly {
    func locationsVC() -> LocationsViewController
    func locationsDataProvider() -> LocationsDataProvider
    func locationsCoordinator() -> LocationsCoordinator
}

extension Assembly: LocationsAssembly {
    func locationsVC() -> LocationsViewController {
        .init(locationsDataProvider: locationsDataProvider())
    }

    func locationsDataProvider() -> LocationsDataProvider {
        LocationsDataProviderImp(apiClient: apiClient)
    }

    func locationsCoordinator() -> LocationsCoordinator {
        LocationsCoordinator(assemlby: self, context: .init())
    }
}
