//
//  MBTestUITestsLaunchTests.swift
//  MBTestUITests
//
//  Created by TLSP-000161 on 24/01/23.
//

import XCTest

class MBTestUITestsLaunchTests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testInitialStateIsCorrect() {
        XCTAssertTrue(app.staticTexts["Exchanges CoinAPI.io"].exists)
    }
}
