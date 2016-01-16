//
//  CountdownViewModel.swift
//  Countdown
//
//  Created by Julian Grosshauser on 20/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Foundation
import ReactiveCocoa

public class CountdownViewModel {

    //MARK: Properties

    private static let BirthdayKey = "CountdownBirthdayKey"
    public static let UserDefaultsSuiteName = "group.com.juliangrosshauser.Countdown"
    private let userDefaults: NSUserDefaults
    public let active = MutableProperty<Bool>(false)
    private let startTimer: Action<Void, NSDate, NoError> = Action { timer(0.1, onScheduler: QueueScheduler()) }
    private var startTimerDisposable: Disposable?
    public let age = MutableProperty<Double?>(nil)

    public var birthday: NSDate? {
        get {
            return userDefaults.objectForKey(CountdownViewModel.BirthdayKey) as? NSDate
        }

        set {
            userDefaults.setObject(newValue, forKey: CountdownViewModel.BirthdayKey)
        }
    }

    //MARK: Initialization

    public init(userDefaults: NSUserDefaults) {
        self.userDefaults = userDefaults

        if let birthday = birthday {
            age.value = ageForBirthday(birthday)
        }

        // Skip initial value
        active.producer.skip(1).startWithNext { [unowned self] active in
            if let startTimerDisposable = self.startTimerDisposable {
                startTimerDisposable.dispose()
                self.startTimerDisposable = nil
            }

            if active {
                self.startTimerDisposable = self.startTimer.apply().start()
            }
        }

        age <~ startTimer.values.map { [unowned self] _ in
            guard let birthday = self.birthday else {
                return nil
            }

            return self.ageForBirthday(birthday)
        }
    }

    //MARK: Age Calculation

    // Credits: https://github.com/soffes/Motivation/blob/master/Motivation/AgeView.swift
    private func ageForBirthday(birthday: NSDate) -> Double {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let ageComponents = calendar.components([.Year, .Day, .Second, .Nanosecond], fromDate: birthday, toDate: now, options: [])

        let daysInYear = Double(calendar.daysInYear(now))
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
