//
//  AppDelegate.swift
//  Countdown
//
//  Created by Julian Grosshauser on 16/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import CountdownKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let viewModel = CountdownViewModel(userDefaults: NSUserDefaults.standardUserDefaults())
        let countdownController = CountdownController(viewModel: viewModel)
        window?.rootViewController = UINavigationController(rootViewController: countdownController)
        window?.makeKeyAndVisible()
        return true
    }
}

