//
//  RegistrationView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 10.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    func setView()
}

class RegistrationViewImp: UIView, RegistrationView {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var registrationLabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var doneButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    func setView() {
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageView.clipsToBounds = false

        registrationLabel.frame = CGRect(x: 0, y: 0, width: 139, height: 27)
        registrationLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        configureTextField(textField: loginTextField)
        configureTextField(textField: passwordTextField)
        configureTextField(textField: repeatPasswordTextField)

        configureButton(button: doneButton)
        configureButton(button: backButton)
    }

   private func configureTextField(textField: UITextField) {
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

    }

    private func configureButton(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
