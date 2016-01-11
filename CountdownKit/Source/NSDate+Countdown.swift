//
//  NSDate+Countdown.swift
//  Countdown
//
//  Created by Julian Grosshauser on 11/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import Foundation

extension NSDate {

    public static func date(day day: Int, month: Int, year: Int) -> NSDate? {
        if [day, month, year].contains({ $0 < 0 }) {
            return nil
        }

        let components = NSDateComponents()
        components.day = day
        components.month = month
        components.year = year

        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) ?? NSCalendar.currentCalendar()
        return calendar.dateFromComponents(components)
    }
}
