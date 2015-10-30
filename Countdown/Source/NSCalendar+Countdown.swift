//
//  NSCalendar+Countdown.swift
//  Countdown
//
//  Created by Julian Grosshauser on 29/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

extension NSCalendar {

    func daysInYear(date: NSDate) -> Int? {
        let dateComponents = components(.Year, fromDate: date)
        let monthsInYear = rangeOfUnit(.Month, inUnit: .Year, forDate: date).length
        var days = 0

        for month in 1...monthsInYear {
            dateComponents.month = month
            if let monthInYear = dateFromComponents(dateComponents) {
                days += rangeOfUnit(.Day, inUnit: .Month, forDate: monthInYear).length
            } else {
                return nil
            }
        }

        return days
    }
}
