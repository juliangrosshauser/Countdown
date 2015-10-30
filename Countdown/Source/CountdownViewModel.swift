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

    //MARK: Age Calculation

    // Credits: https://github.com/soffes/Motivation/blob/master/Motivation/AgeView.swift
    private func ageForBirthday(birthday: NSDate) -> Double {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let ageComponents = calendar.components([.Year, .Day, .Second, .Nanosecond], fromDate: birthday, toDate: now, options: [])

        let daysInYear = Double(calendar.daysInYear(now) ?? 365)
        let hoursInDay = Double(calendar.rangeOfUnit(.Hour, inUnit: .Day, forDate: now).length)
        let minutesInHour = Double(calendar.rangeOfUnit(.Minute, inUnit: .Hour, forDate: now).length)
        let secondsInMinute = Double(calendar.rangeOfUnit(.Second, inUnit: .Minute, forDate: now).length)
        let nanosecondsInSecond = Double(calendar.rangeOfUnit(.Nanosecond, inUnit: .Second, forDate: now).length)

        let seconds = Double(ageComponents.second) + Double(ageComponents.nanosecond) / nanosecondsInSecond
        let minutes = seconds / secondsInMinute
        let hours = minutes / minutesInHour
        let days = Double(ageComponents.day) + hours / hoursInDay
        let years = Double(ageComponents.year) + days / daysInYear
        
        return years
    }
}
