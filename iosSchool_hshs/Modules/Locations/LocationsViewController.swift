//
//  LocationsViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import UIKit

class LocationsViewController: UIViewController {
    private let locationsDataProvider: LocationsDataProvider

    init(locationsDataProvider: LocationsDataProvider) {
        self.locationsDataProvider = locationsDataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocations()
    }

    func getLocations() {
        locationsDataProvider.getLocations { locations, error in
            print(locations ?? "Локаций нет")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
