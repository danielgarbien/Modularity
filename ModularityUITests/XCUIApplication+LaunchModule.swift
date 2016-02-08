//
//  XCUIApplication+LaunchModule.swift
//  Modularity
//
//  Created by Daniel Garbień on 08/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    convenience init(launchModule: LaunchModule) {
        self.init()
        launchEnvironment = launchModule.launchEnvironment()
    }
}
