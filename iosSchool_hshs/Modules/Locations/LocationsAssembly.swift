//
//  LocationsAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import Foundation

protocol LocationsAssembly {
    func locationsVC() -> LocationsViewController<LocationsViewImp>
    func locationsDataProvider() -> LocationsDataProvider
    func locationsCoordinator() -> LocationsCoordinator
}

extension Assembly: LocationsAssembly {
    func locationsVC() -> LocationsViewController<LocationsViewImp> {
        .init(locationsDataProvider: locationsDataProvider())
    }

    func locationsDataProvider() -> LocationsDataProvider {
        LocationsDataProviderImp(locationsApiClient: apiClient)
    }

    func locationsCoordinator() -> LocationsCoordinator {
        LocationsCoordinator(assembly: self, context: .init())
    }
}
