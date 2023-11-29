//
//  LocationsViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import UIKit

class LocationsViewController<View: LocationsView>: BaseViewController<View> {
    var selectLocation: ((LocationsCellData) -> Void)?
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
        setupBar()
        rootView.setView()
        rootView.selectLocation = selectLocation
        getLocations()
    }

    // MARK: - Private methods

    private func setupBar() {
            title = "Выбор планеты"
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
                .font: UIFont.systemFont(ofSize: 18)
            ]
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .refresh,
                target: self,
                action: #selector(reload)
            )
        }

    @objc
    private func reload() {
        getLocations()
    }

    private func getLocations() {
        locationsDataProvider.getLocations { [weak self] locations, error in
            guard let locations else {
                print(error?.rawValue ?? "Нет ошибки")
                return
            }
            self?.rootView.update(data: LocationsViewData(list: locations))
        }
    }
}
