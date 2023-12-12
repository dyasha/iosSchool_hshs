//
//  RegistrationViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit
import PKHUD
import SPIndicator

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {
    private let registrationDataProvider: RegistrationDataProvider
    private let storageManager: StorageManager
    var onRegistrationSuccess: (() -> Void)?

    init(
        registrationDataProvider: RegistrationDataProvider,
        storageManager: StorageManager,
        onRegistrationSuccess: (() -> Void)?
    ) {
        self.registrationDataProvider = registrationDataProvider
        self.storageManager = storageManager
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        rootView.delegate = self
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
    func registrationDoneDidTap(login: String, password: String) {
        HUD.show(.progress)
        registrationDataProvider.registration(username: login, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, token != nil else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            onRegistrationSuccess?()
        }
    }

    func registration() {
        registrationDataProvider.registration(username: "maybeusertest", password: "12345678") { token, error in
            print(token ?? "Токена нет")
            print(error?.rawValue ?? "Нет ошибки")
        }
        self.storageManager.saveLastLoginDate()
        self.onRegistrationSuccess?()

    func backDidTap() {
        dismiss(animated: true, completion: nil)
    }
}
