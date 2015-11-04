//
//  TodayViewController.swift
//  CountdownToday
//
//  Created by Julian Grosshauser on 04/11/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import NotificationCenter

@objc(TodayViewController)
class TodayViewController: UIViewController, NCWidgetProviding {
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(.NoData)
    }
}
