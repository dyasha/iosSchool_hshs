//
//  ProfileViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {
    private var onLogout: (() -> Void)?
    private let storageManager: StorageManager
    private let dateFormatter: DateFormatterManager

    init(onLogout: (() -> Void)?, storageManager: StorageManager, dateFormatter: DateFormatterManager) {
        self.onLogout = onLogout
        self.storageManager = storageManager
        self.dateFormatter = dateFormatter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")
        rootView.setView()
        rootView.update(
            data: .init(
                image: UIImage(named: "registration-foreground"),
                login: self.storageManager.getLogin(),
                date: self.dateFormatter.formate(date: self.storageManager.getLastLoginDate()),
                color: UIColor(named: "iceberg"),
                onLogout: { [weak self] _ in
                    self?.storageManager.removeToken()
                    self?.onLogout?()
                }
            )
        )
    }
}
