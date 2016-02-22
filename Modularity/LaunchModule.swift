//
//  Module.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import Foundation

/// Launch module environment variable name
private let launchModuleEnvironmentVariableName = "launchModule"

/// Launch module expected envirnment value names
enum LaunchModule: String {
    case Master
    case Detail
}

// MARK: - To be used inside UI tests
extension LaunchModule {
    
    func launchEnvironment() -> [String: String] {
        return [launchModuleEnvironmentVariableName: rawValue]
    }
}

// MARK: - To be used in app delegate
extension LaunchModule {
    
    static func currentProcessLaunchModule() -> LaunchModule? {
        return NSProcessInfo.launchModule()
    }
}

private extension NSProcessInfo {
    
    static func launchModule() -> LaunchModule? {
        guard let launchModule = processInfo().environment[launchModuleEnvironmentVariableName] else {
            return nil
        }
        return LaunchModule(rawValue: launchModule)
    }
}
