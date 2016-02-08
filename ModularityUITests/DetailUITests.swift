//
//  DetailUITests.swift
//  Modularity
//
//  Created by Daniel Garbień on 08/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import XCTest

class DetailUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        XCUIApplication(launchModule: .Detail).launch()
    }
    
    func testUIElementsPresence() {
        
        let testUIElements = {
            let app = XCUIApplication()
            XCTAssert(app.staticTexts["Hi Jimmy!"].hittable)
            XCTAssert(app.otherElements.containingType(.StaticText,
                identifier:"Hi Jimmy!").childrenMatchingType(.Image).element.hittable)
            XCTAssert(app.buttons["Bye Jimmy."].hittable)
        }
        
        XCUIDevice.sharedDevice().orientation = .Portrait
        testUIElements()
        XCUIDevice.sharedDevice().orientation = .LandscapeRight
        testUIElements()
    }
}
