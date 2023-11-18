//
//  RegistrationViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {
    private let registrationDataProvider: RegistrationDataProvider

    init(registrationDataProvider: RegistrationDataProvider) {
        self.registrationDataProvider = registrationDataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
    }
}
