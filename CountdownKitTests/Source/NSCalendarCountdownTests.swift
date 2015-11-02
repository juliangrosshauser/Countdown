//
//  CountdownKitTests.swift
//  CountdownKitTests
//
//  Created by Julian Grosshauser on 02/11/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import XCTest
@testable import CountdownKit

class NSCalendarCountdownTests: XCTestCase {

    func testDaysInYear() {
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = NSDateComponents()

        // Test every year from 1700 to 2200
        for year in 1700...2200 {
            dateComponents.year = year
            guard let date = calendar.dateFromComponents(dateComponents) else {
                XCTFail("Can't create date object from components")
                return
            }
            
            let days = calendar.daysInYear(date)

            // Every year that's divisible by 4, but not 100,
            // and every year that's divisible by 400 is a leap year
            if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                XCTAssertEqual(days, 366)
            } else {
                XCTAssertEqual(days, 365)
            }
        }
    }
}
