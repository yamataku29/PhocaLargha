//
//  ViewController.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/06/28.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import UIKit
import PhocaLargha

class ViewController: UIViewController {
    @IBOutlet weak var titleTextLabel: UITextField!
    @IBOutlet weak var buttonTextLabel: UITextField!
    @IBOutlet weak var textColorSegment: UISegmentedControl!
    @IBOutlet weak var dialogColorSegment: UISegmentedControl!
    @IBOutlet weak var dialogSizeSegment: UISegmentedControl!
    @IBOutlet weak var backgroundColorSegment: UISegmentedControl!
    @IBOutlet weak var alphaResultLabel: UILabel!
    @IBOutlet weak var adjustAlphaSlider: UISlider!
    @IBAction func adjustAlphaSlider(_ sender: UISlider) {
        alphaResultLabel.text = String(sender.value.secondDecimalRoundDown)
    }
    @IBAction func singleAlertButton(_ sender: UIButton) {
        let firstViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
                                                   footerComponent: lastFooterComponent, image: firstImage,
                                                   baseViewColor: dialogColor)
        let popNavi = PopNavi()
        popNavi.configureOption.backgroundViewGradientType = gradientStyle
        popNavi.configureOption.shouldDisplayPageControl = false
        popNavi.configureOption.backgroundAlpha = backgroundAlpha
        popNavi.configureOption.completion = completion
        popNavi.setBaseView(baseViewComponent: firstViewComponent, isLastView: true)
        popNavi.configureNavigation()
        popNavi.slideUp(duration: 0.7)
    }
    @IBAction func walkThroughButton(_ sender: UIButton) {
        let firstViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
                                                   footerComponent: footerComponent, image: firstImage,
                                                   baseViewColor: dialogColor)
        let secondViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
                                                    footerComponent: footerComponent, image: secondImage,
                                                    baseViewColor: dialogColor)
        let thirdViewComponent = BaseViewComponent(viewType: dialogSize, topComponent: topComponent,
                                                   footerComponent: lastFooterComponent, image: thirdImage,
                                                   baseViewColor: dialogColor)
        let popNavi = PopNavi()

        popNavi.configureOption.backgroundViewGradientType = gradientStyle
        popNavi.configureOption.backgroundAlpha = backgroundAlpha
        popNavi.configureOption.completion = completion
        popNavi.setBaseView(baseViewComponent: firstViewComponent, isLastView: false)
        popNavi.setBaseView(baseViewComponent: secondViewComponent, isLastView: false)
        popNavi.setBaseView(baseViewComponent: thirdViewComponent, isLastView: true)
        popNavi.configureNavigation()
        popNavi.slideUp(duration: 0.7)
    }

    var latestButtonText: String {
        let isTextEmpty = buttonTextLabel.text == ""
        return isTextEmpty ? "" : "FINISH"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextLabel.textAlignment = .center
        titleTextLabel.text = "Pop Navi Test"
        titleTextLabel.delegate = self
        buttonTextLabel.textAlignment = .center
        buttonTextLabel.text = "NEXT"
        buttonTextLabel.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

private extension ViewController {
    enum TextColorType: Int {
        case black
        case white
        case orange

        var color: UIColor {
            switch self {
            case .black:
                return UIColor.black
            case .white:
                return UIColor.white
            case .orange:
                return UIColor.orange
            }
        }
    }
    enum DialogColor: Int {
        case white
        case black

        var color: UIColor {
            switch self {
            case .white:
                return UIColor.white
            case .black:
                return UIColor.black
            }
        }
    }
    var topComponent: TopComponent? {
        guard let titleText = titleTextLabel.text, !titleText.isEmpty else {
            return nil
        }
        let textColor = TextColorType.init(rawValue: textColorSegment.selectedSegmentIndex)!.color
        return TopComponent(text: titleText, textColor: textColor)
    }

    var footerComponent: FooterComponent? {
        guard let buttonText = buttonTextLabel.text, !buttonText.isEmpty else {
            return nil
        }
        let textColor = TextColorType.init(rawValue: textColorSegment.selectedSegmentIndex)!.color
        return FooterComponent(buttonTitle: buttonText, buttonTextColor: textColor)
    }

    var lastFooterComponent: FooterComponent? {
        guard let buttonText = buttonTextLabel.text, !buttonText.isEmpty else {
            return nil
        }
        let textColor = TextColorType.init(rawValue: textColorSegment.selectedSegmentIndex)!.color
        return FooterComponent(buttonTitle: latestButtonText, buttonTextColor: textColor)
    }

    var gradientStyle: GradientStyle {
        return GradientStyle(rawValue: backgroundColorSegment.selectedSegmentIndex)!
    }

    var backgroundAlpha: CGFloat {
        return adjustAlphaSlider.value.toCGFloat
    }

    var dialogSize: BaseViewComponent.ViewType {
        return BaseViewComponent.ViewType(rawValue: dialogSizeSegment.selectedSegmentIndex)!
    }

    var dialogColor: UIColor {
        return DialogColor.init(rawValue: dialogColorSegment.selectedSegmentIndex)!.color
    }

    var firstImage: UIImage {
        switch DialogColor.init(rawValue: dialogColorSegment.selectedSegmentIndex)! {
        case .white:
            return UIImage(named: "first_image")!
        case .black:
            return UIImage(named: "black_first_image")!
        }
    }

    var secondImage: UIImage {
        switch DialogColor.init(rawValue: dialogColorSegment.selectedSegmentIndex)! {
        case .white:
            return UIImage(named: "second_image")!
        case .black:
            return UIImage(named: "black_second_image")!
        }
    }

    var thirdImage: UIImage {
        switch DialogColor.init(rawValue: dialogColorSegment.selectedSegmentIndex)! {
        case .white:
            return UIImage(named: "third_image")!
        case .black:
            return UIImage(named: "black_third_image")!
        }
    }

    var completion: (() -> ())? {
        return { [weak self] () -> Void in
            // Define the handler after the dialog is closed.
            //self?.alert()
        }
    }

    func alert() -> Void {
        let alert: UIAlertController = UIAlertController(title: "Complete!", message: "Please push \"OK\"", preferredStyle:  .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}

private extension Float {
    var secondDecimalRoundDown: Float {
        let tmpIncrease = self * 10
        return floor(tmpIncrease) / 10
    }

    var toCGFloat: CGFloat {
        return CGFloat(self)
    }
}
