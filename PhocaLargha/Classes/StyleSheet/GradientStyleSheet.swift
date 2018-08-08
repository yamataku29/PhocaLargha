//
//  GradientStyleSheet.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/07/05.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

public enum GradientStyle: Int {
    case normal
    case muddySoda
    case limeGreen
    case grapeSoda
    case thinPeach
    case lemonGreenTea
    case pineOrange
    case popCandy
    case peachGrape
    case lemonGrape
    case grapeAndMuscat
}

private struct GradientStyleSheet {
    var frame: CGRect
    init(frame: CGRect) {
        self.frame = frame
    }
    var limeGreen: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.limeGreen, frame: frame)
    }
    var muddySoda: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.muddySoda, frame: frame)
    }
    var grapeSoda: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.grapeSoda, frame: frame)
    }
    var thinPeach: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.thinPeach, frame: frame)
    }
    var lemonGreenTea: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.lemonGreenTea, frame: frame)
    }
    var pineOrange: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.pineOrange, frame: frame)
    }
    var popCandy: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.popCandy, frame: frame)
    }
    var peachGrape: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.peachGrape, frame: frame)
    }
    var lemonGrape: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.lemonGrape, frame: frame)
    }
    var grapeAndMuscat: CAGradientLayer {
        return getGradientLayer(colorSet: GradientStyleList.grapeAndMuscat, frame: frame)
    }

    func getGradientLayer(colorSet: GradientStyleList.ColorSet, frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let gradientColorSet = [colorSet.top.cgColor, colorSet.bottom.cgColor]
        gradientLayer.colors = gradientColorSet
        gradientLayer.frame = frame
        return gradientLayer
    }
}

private struct GradientStyleList {
    typealias ColorSet = (top: UIColor, bottom: UIColor)
    static let muddySoda = ColorSet(top: UIColor(0.07, 0.13, 0.26), bottom: UIColor(0.54, 0.74, 0.74))
    static let limeGreen = ColorSet(top: UIColor(0.03, 0.68, 0.92), bottom: UIColor(0.16, 0.96, 0.6))
    static let grapeSoda = ColorSet(top: UIColor(0.13, 0.83, 0.99), bottom: UIColor(0.72, 0.13, 1.0))
    static let thinPeach = ColorSet(top: UIColor(0.98, 0.67, 0.66), bottom: UIColor(0.87, 0.84, 0.95))
    static let lemonGreenTea = ColorSet(top: UIColor(0.96, 0.82, 0.25), bottom: UIColor(0.09, 0.63, 0.52))
    static let pineOrange = ColorSet(top: UIColor(0.98, 0.85, 0.38), bottom: UIColor(1.0, 0.15, 0.15))
    static let popCandy = ColorSet(top: UIColor(0.98, 0.55, 1.0), bottom: UIColor(0.17, 1.0, 0.53))
    static let peachGrape = ColorSet(top: UIColor(0.38, 0.52, 1.0), bottom: UIColor(1.0, 0.0, 0.0))
    static let lemonGrape = ColorSet(top: UIColor(0.98, 0.93, 0.01), bottom: UIColor(0.53, 0.18, 0.85))
    static let grapeAndMuscat = ColorSet(top: UIColor(0.18, 0.29, 0.85), bottom: UIColor(0.01, 0.98, 0.02))
}

extension UIView {
    func setGradientColor(type: GradientStyle) {
        let gradientStyleSheet = GradientStyleSheet(frame: bounds)
        var gradientLayer = CAGradientLayer()
        switch type {
        case .muddySoda:
            gradientLayer = gradientStyleSheet.muddySoda
        case .limeGreen:
            gradientLayer = gradientStyleSheet.limeGreen
        case .grapeSoda:
            gradientLayer = gradientStyleSheet.grapeSoda
        case .thinPeach:
            gradientLayer = gradientStyleSheet.thinPeach
        case .lemonGreenTea:
            gradientLayer = gradientStyleSheet.lemonGreenTea
        case .pineOrange:
            gradientLayer = gradientStyleSheet.pineOrange
        case .popCandy:
            gradientLayer = gradientStyleSheet.popCandy
        case .peachGrape:
            gradientLayer = gradientStyleSheet.peachGrape
        case .lemonGrape:
            gradientLayer = gradientStyleSheet.lemonGrape
        case .grapeAndMuscat:
            gradientLayer = gradientStyleSheet.grapeAndMuscat
        case .normal:
            break
        }
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

private extension UIColor {
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
