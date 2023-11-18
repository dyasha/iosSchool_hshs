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

    func setView() {
        imageView.image = UIImage(named: "registration-foreground")
        imageView.contentMode = .scaleAspectFill
    }
}
