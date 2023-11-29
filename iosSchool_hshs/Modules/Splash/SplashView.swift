//
//  SplashView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 09.11.2023.
//

import UIKit

protocol SplashView: UIView {
    func setView()
}

class SplashViewImp: UIView, SplashView {
    @IBOutlet private var imageView: UIImageView!

    func setView() {
    }
}
