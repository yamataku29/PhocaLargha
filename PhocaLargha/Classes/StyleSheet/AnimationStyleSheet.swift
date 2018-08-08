//
//  AnimationStyleSheet.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/06/28.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

protocol AppearAnimation: class {
    func slideUp(with dialogs: [BaseView], backgroundView: UIView?, backgroundAlpha: CGFloat, isBackgroundFadeIn: Bool, duration: TimeInterval)
}

protocol DimissAnimation:  class {
    func slideDown(with dialogs: [BaseView], presentingView: UIView?, duration: TimeInterval, delegate: DimissAnimationDelegate?)
}

protocol DimissAnimationDelegate {
    func endDismissAnimation()
}

extension DimissAnimation where Self: UIViewController {
    func slideDown(with dialogs: [BaseView], presentingView: UIView?, duration: TimeInterval, delegate: DimissAnimationDelegate?) {
        guard !dialogs.isEmpty else { return }
        dialogs.forEach { dialog in
            UIView.animate(withDuration: duration,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: UIViewAnimationOptions.curveEaseInOut,
                           animations: {
                            presentingView?.alpha = 0
                            dialog.frame.origin.y = UIScreen.main.bounds.height
            }, completion: { _ in
                delegate?.endDismissAnimation()
            })
        }
    }
}

extension AppearAnimation where Self: UIViewController {
    func slideUp(with dialogs: [BaseView], backgroundView: UIView?, backgroundAlpha: CGFloat, isBackgroundFadeIn: Bool, duration: TimeInterval) {
        guard !dialogs.isEmpty else { return }
        dialogs.forEach { dialog in
            backgroundView?.alpha = 0
            dialog.frame.origin.y = UIScreen.main.bounds.height
            UIView.animate(withDuration: duration,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 1,
                           options: UIViewAnimationOptions.allowUserInteraction,
                           animations: {
                            if isBackgroundFadeIn {
                                backgroundView?.alpha = backgroundAlpha
                            }
                            dialog.center.y = UIScreen.main.bounds.midY
                            self.view.layoutIfNeeded()
            }, completion: { _ in
            })
        }
    }
}
