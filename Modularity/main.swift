//
//  main.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

private class LaunchModuleAppDelegate: UIResponder, UIApplicationDelegate {
    
    @objc
    var window: UIWindow?
    
    @objc
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.rootViewController = rootViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func rootViewController() -> UIViewController {
        guard let launchModule = LaunchModule.currentProcessLaunchModule() else {
            fatalError("LaunchModuleAppDelegate cannot be used if LaunchModule.currentProcessLaunchModule() returns nil")
        }
        switch launchModule {
        case .Master:
            return MasterViewController(delegate: nil)
        case .Detail:
            let person = Person(name: "Jimmy", imageName: "jimmy")
            return DetailViewController(person: person, delegate: nil)
        }
    }
}

if (LaunchModule.currentProcessLaunchModule() != nil){
    UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(LaunchModuleAppDelegate))
} else {
    UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(AppDelegate))
}
