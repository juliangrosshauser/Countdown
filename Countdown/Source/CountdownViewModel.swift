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

    private let userDefaults: NSUserDefaults

    //MARK: Initialization

    init(userDefaults: NSUserDefaults) {
        self.userDefaults = userDefaults
    }
}
