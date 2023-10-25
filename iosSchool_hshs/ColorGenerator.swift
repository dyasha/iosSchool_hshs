//
//  ColorGenerator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 24.10.2023.
//

import Foundation

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

class ColorGenerator {
    var alpha: Double
    let colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]

    init(alpha: Double) {
        self.alpha = alpha
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
