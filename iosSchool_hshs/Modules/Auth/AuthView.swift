//
//  AuthView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import UIKit

protocol AuthView: UIView {
    func setView()
}

class AuthViewImp: UIView, AuthView {
        @IBOutlet private var imageView: UIImageView!
        @IBOutlet private var labelView: UIView!
        @IBOutlet private var titleLabel: UILabel!
        @IBOutlet private var subTitleLabel: UILabel!
        @IBOutlet private var loginTextField: UITextField!
        @IBOutlet private var passwordTextField: UITextField!
        @IBOutlet private var loginButton: UIButton!
        @IBOutlet private var registrationButton: UIButton!

    func setView() {
        imageView.image = UIImage(named: "auth-background")
        imageView.contentMode = .scaleAspectFill

        labelView.layer.cornerRadius = 10
        labelView.layer.masksToBounds = true
        labelView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowRadius = 10

        labelView.layer.shadowOffset = CGSize(width: 0, height: 8)
        labelView.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.30)

        loginTextField.layer.cornerRadius = 15
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true

        registrationButton.layer.cornerRadius = 10
        registrationButton.layer.masksToBounds = true

    }

    @IBAction func login(sender: UIButton) {
        
    }
}
