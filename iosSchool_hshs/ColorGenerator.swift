//
//  ColorGenerator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 24.10.2023.
//

import Foundation
import UIKit

struct Color {
    var alpha: Brightness
    let red: Double
    let green: Double
    let blue: Double

    func description() {
        print("R: \(red), alpha: \(alpha.rawValue)")
    }

    init(red: Double, green: Double, blue: Double) {
        self.alpha = .dim
        self.red = red
        self.green = green
        self.blue = blue
    }
}
protocol ColorGeneratorProtocol {
    var alpha: Double { get set }
    var colorCodes: [Double] { get }

    func createColor() -> UIColor

    init(alpha: Double)
    }

class ColorGenerator: ColorGeneratorProtocol {
    var alpha: Double
    var colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    let whiteColor: UIColor = .white

    required init(alpha: Double) {
        self.alpha = alpha
    }
    func createColor() -> UIColor {
        UIColor(white: 1, alpha: alpha)
    }
}

    enum Brightness: Double {
        case dim = 0.1
        case average = 0.5
        case bright = 1

        func description() -> String {
            switch self {
            case .dim:
                return "Тусклый"
            case .average:
                return "Средний"
            case .bright:
                return "Яркий"
            }
        }
    }
