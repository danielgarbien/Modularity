//
//  TabBarWireframe.swift
//  Modularity
//
//  Created by Daniel Garbień on 23/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import Foundation
import UIKit

class TabBarWireframe {
    
    private lazy var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            self.masterDetailViewController,
            self.storyboardViewController,
            self.thirdViewController
        ]
        tabBarController.viewControllers!.forEach { viewController in
            viewController.title = String(viewController.dynamicType)
        }
        return tabBarController
    }()
    private lazy var masterDetailViewController = WireframeViewController(wireframe: MasterDetailWireframe())
    private lazy var storyboardViewController = UIStoryboard(name: "Storyboard", bundle: nil).instantiateInitialViewController()!
    private lazy var thirdViewController: UIViewController = ThirdViewController()
    
}

extension TabBarWireframe: Wireframe {
    
    var rootViewController: UIViewController {
        return tabBarController
    }
}
