//
//  PopNaviConfigureOption.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/06/29.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

public struct PopNaviConfigureOption {
    public var backgroundColor: UIColor
    public var backgroundAlpha: CGFloat
    public var pageControlColor: UIColor
    public var isDismissibleForTap: Bool
    public var shouldDisplayPageControl: Bool
    public var backgroundViewGradientType: GradientStyle
    public var completion: (() -> ())?

    init(backgroundColor: UIColor = UIColor.black,
         backgroundAlpha: CGFloat = 0.5,
         pageControlColor: UIColor = .orange,
         isDismissibleForTap: Bool = true,
         shouldDisplayPageControl: Bool = true,
         backgroundViewFradientType: GradientStyle = .normal,
         completion: (() -> ())? = nil) {
        self.backgroundColor = backgroundColor
        self.backgroundAlpha = backgroundAlpha
        self.pageControlColor = pageControlColor
        self.isDismissibleForTap = isDismissibleForTap
        self.shouldDisplayPageControl = shouldDisplayPageControl
        self.backgroundViewGradientType = backgroundViewFradientType
        self.completion = completion
    }
}
