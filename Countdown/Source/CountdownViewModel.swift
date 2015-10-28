//
//  CountdownViewModel.swift
//  Countdown
//
//  Created by Julian Grosshauser on 20/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

class CountdownViewModel {

    //MARK: Properties

    private static let birthdayKey = "CountdownBirthdayKey"
    private let userDefaults: NSUserDefaults
    private(set) var age: Double?

    var birthday: NSDate? {
        get {
            return userDefaults.objectForKey(CountdownViewModel.birthdayKey) as? NSDate
        }

        set {
            userDefaults.setObject(newValue, forKey: CountdownViewModel.birthdayKey)
        }
    }

    //MARK: Initialization

    init(userDefaults: NSUserDefaults) {
        self.userDefaults = userDefaults
    }
}
