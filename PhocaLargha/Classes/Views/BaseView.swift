//
//  BaseView.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/06/29.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

public class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public convenience init(component: BaseViewComponent, with superViewSize: CGSize,
                     centerPosition: CGPoint, gesture: UITapGestureRecognizer? = nil,
                     textFieldDelegate: UITextFieldDelegate) {
        var baseViewFrame = CGRect()
        switch component.viewType {
        case .small:
            baseViewFrame = CGRect(x: 0, y: 0, width: superViewSize.width/1.5,
                                   height: superViewSize.height/2.3)
        case .medium:
            baseViewFrame = CGRect(x: 0, y: 0, width: superViewSize.width/1.3,
                                   height: superViewSize.height/1.8)
        case .large:
            baseViewFrame = CGRect(x: 0, y: 0, width: superViewSize.width/1.2,
                                   height: superViewSize.height/1.3)
        }
        self.init(frame: baseViewFrame)
        center = centerPosition
        backgroundColor = component.baseViewColor
        delegate = textFieldDelegate

        let topViewHeight = component.topComponent?.height ?? 0
        let bottomViewHeight = component.footerComponent?.height ?? 0
        setImage(with: component.image, topViewHeight: topViewHeight, bottomViewHeight: bottomViewHeight)

        if let topComponent = component.topComponent {
            setTopView(text: topComponent.text, textColor: topComponent.textColor,
                       font: topComponent.font, height: topComponent.height)
        }

        if let footerComponent = component.footerComponent {
            setFooterView(component: footerComponent, cornerRadius: component.cornerRadius,
                          width: bounds.width, gesture: gesture)
        }
    }
    private weak var delegate: UITextFieldDelegate?
}

private extension BaseView {
    func setTopView(text: String, textColor: UIColor, font: UIFont, height: CGFloat) {
        let sidePadding: CGFloat = 30
        let titleLabel = UILabel()
        titleLabel.bounds.size = CGSize(width: bounds.width - sidePadding, height: height)
        titleLabel.center = CGPoint(x: bounds.width/2, y: height/2)
        titleLabel.text = text
        titleLabel.textColor = textColor
        titleLabel.textAlignment = .center
        titleLabel.font = font
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 10
        addSubview(titleLabel)
    }
    func setFooterView(component: FooterComponent, cornerRadius: CGFloat,
                       width: CGFloat, gesture: UITapGestureRecognizer?) {
        let footerViewFrame = CGRect(x: 0, y: bounds.height - component.height,
                                     width: bounds.width, height: component.height)
        let footerView = FooterView(component: component, frame: footerViewFrame,
                                    cornerRadius: cornerRadius, gesture: gesture)
        footerView.backgroundColor = component.backgroundColor
        footerView.setBottomRoundCorner(with: CGSize(width: cornerRadius, height: cornerRadius))
        addSubview(footerView)
    }
    func setImage(with image: UIImage, topViewHeight: CGFloat, bottomViewHeight: CGFloat) {
        let imageView = UIImageView(image: image)
        let centerOffset = topViewHeight - bottomViewHeight
        imageView.bounds.size = CGSize(width: bounds.width,
                                       height: bounds.height - topViewHeight - bottomViewHeight)
        imageView.center.x = bounds.width/2
        imageView.center.y = (bounds.height/2) + (centerOffset/2)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
}

class FirstBaseView: BaseView {}
class LastBaseView: BaseView {}

fileprivate class FooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(component: FooterComponent,
                     frame: CGRect, cornerRadius: CGFloat, gesture: UITapGestureRecognizer?) {
        self.init(frame: frame)
        setFooterButton(component: component, cornerRadius: cornerRadius, gesture: gesture)
    }
    func setFooterButton(component: FooterComponent, cornerRadius: CGFloat,
                         gesture: UITapGestureRecognizer? = nil) {
        let buttonView = FooterButtonView()
        if let gesture = gesture {
            buttonView.addGestureRecognizer(gesture)
        }
        buttonView.bounds.size = CGSize(width: bounds.width*2/3, height: bounds.height*3/5)
        buttonView.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        buttonView.layer.cornerRadius = cornerRadius

        let titleLabel = UILabel()
        titleLabel.text = component.buttonTitle
        titleLabel.textColor = component.buttonTextColor
        titleLabel.font = component.buttonTextFont
        titleLabel.textAlignment = .center
        titleLabel.center = CGPoint(x: buttonView.bounds.width/2, y: buttonView.bounds.height/2)
        titleLabel.bounds.size = buttonView.bounds.size
        buttonView.addSubview(titleLabel)
        addSubview(buttonView)
    }
}

class FooterButtonView: UIView {}

extension UIView {
    func setBottomRoundCorner(with size: CGSize) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.bottomLeft, .bottomRight],
                                    cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
