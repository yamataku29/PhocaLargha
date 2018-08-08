//
//  ComponentConfigure.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/08/01.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

public struct BaseViewComponent {
    public enum ViewType: Int {
        case small
        case medium
        case large
    }

    public var viewType: ViewType
    public var cornerRadius: CGFloat
    public var topComponent: TopComponent?
    public var footerComponent: FooterComponent?
    public var image: UIImage
    public var baseViewColor: UIColor

    public init(viewType: ViewType,
         cornerRadius: CGFloat = 10,
         topComponent: TopComponent? = nil,
         footerComponent: FooterComponent? = nil,
         image: UIImage,
         baseViewColor: UIColor = .white) {
        self.viewType = viewType
        self.cornerRadius = cornerRadius
        self.topComponent = topComponent
        self.footerComponent = footerComponent
        self.image = image
        self.baseViewColor = baseViewColor
    }
}

public struct TopComponent {
    public var text: String
    public var textColor: UIColor
    public var font: UIFont
    public var height: CGFloat

    public init(text: String,
         textColor: UIColor = .black,
         font: UIFont = .boldSystemFont(ofSize: 22),
         height: CGFloat = 80) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.height = height
    }
}

public struct FooterComponent {
    public var buttonTitle: String?
    public var buttonTextColor: UIColor?
    public var backgroundColor: UIColor
    public var buttonTextFont: UIFont?
    public var height: CGFloat

    public init(buttonTitle: String? = nil,
         buttonTextColor: UIColor? = .black,
         backgroundColor: UIColor = .clear,
         buttonTextFont: UIFont? = UIFont.boldSystemFont(ofSize: 16),
         height: CGFloat = 50) {
        self.buttonTitle = buttonTitle
        self.buttonTextColor = buttonTextColor
        self.backgroundColor = backgroundColor
        self.buttonTextFont = buttonTextFont
        self.height = height
    }
}
