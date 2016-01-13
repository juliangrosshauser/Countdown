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
    }
}

//MARK: NCWidgetProviding

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(.NoData)
    }
}
