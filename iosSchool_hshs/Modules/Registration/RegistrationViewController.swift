//
//  RegistrationViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    private let registrationDataProvider: RegistrationDataProvider
    var onRegistrationSuccess: (() -> Void)?

    init(registrationDataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.registrationDataProvider = registrationDataProvider
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1.0)
        registration()
    }

    func registration() {
        registrationDataProvider.registration(username: "maybeusertest", password: "12345678") { token, error in
            print(token ?? "Токена нет")
            print(error?.rawValue ?? "Нет ошибки")
        }
        self.onRegistrationSuccess?()
    }
}
