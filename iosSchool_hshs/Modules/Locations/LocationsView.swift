//
//  LocationsView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import UIKit

protocol LocationsView: UIView {
    var selectLocation: ((LocationsCellData) -> Void)? { get set }

    func setView()
    func update(data: LocationsViewData)
}

class LocationsViewImp: UIView, LocationsView {
    var selectLocation: ((LocationsCellData) -> Void)?
    private var viewData: LocationsViewData?
    private let tableView = UITableView()

    func setView() {
        backgroundColor = .white

        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "locations-background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        let nib = UINib(nibName: LocationsCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LocationsCell.className)
        tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        tableView.allowsSelectionDuringEditing = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor(.clear)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(data: LocationsViewData) {
        viewData = data

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: UITableViewDataSource

extension LocationsViewImp: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData?.cellsData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewData else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationsCell.className) else {
            return UITableViewCell()
        }
        (cell as? LocationsCell)?.data = viewData.cellsData[indexPath.row]
        return cell
    }
}

// MARK: UITableViewDelegate

extension LocationsViewImp: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewData else {
            return
        }
        selectLocation?(viewData.cellsData[indexPath.row])
    }
}
