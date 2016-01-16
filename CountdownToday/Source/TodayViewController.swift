//
//  TodayViewController.swift
//  CountdownToday
//
//  Created by Julian Grosshauser on 04/11/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import NotificationCenter
import CountdownKit

@objc(TodayViewController)
class TodayViewController: UIViewController {

    //MARK: Properties

    let viewModel: CountdownViewModel

    let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        let preferredFontSize = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline).pointSize
        ageLabel.font = UIFont.monospacedDigitSystemFontOfSize(preferredFontSize, weight: UIFontWeightBold)
        ageLabel.textColor = .whiteColor()
        return ageLabel
    }()

    //MARK: Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        guard let userDefaults = NSUserDefaults(suiteName: CountdownViewModel.UserDefaultsSuiteName) else {
            fatalError("Can't initialize user defaults for app group")
        }

        viewModel = CountdownViewModel(userDefaults: userDefaults)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 0, height: 50)
        view.addSubview(ageLabel)
        NSLayoutConstraint(item: ageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: ageLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0).active = true

        if let age = viewModel.age.value {
            ageLabel.text = String(format: "%.12f", age)
        } else {
            ageLabel.text = "Please open Countdown and set birthday"
        }
    }
}

//MARK: NCWidgetProviding

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(.NoData)
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
}
