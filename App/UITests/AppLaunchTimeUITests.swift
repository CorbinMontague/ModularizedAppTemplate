//
//  AppLaunchTimeUITests.swift
//  UITests
//
//  Created by Corbin Montague on 5/18/21.
//

import Foundation
import XCTest

final class AppLaunchTimeUITests: XCTestCase {

    /// Measure warm app launch over 5 iterations (after one throw-away launch)
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric(waitUntilResponsive: true)]) {
            XCUIApplication().launch()
        }
    }
}
