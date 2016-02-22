//
//  UIViewController+Containment.swift
//  Modularity
//
//  Created by Daniel Garbień on 23/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Add childController with no transition.
     Embeds its view in container.
     Calls didMoveToParentViewController on childController at a last step.
     */
    func addImmediatelyChildViewController(childController: UIViewController, embeddedInView container: UIView) {
        addChildViewController(childController)
        container.embedSubview(childController.view)
        childController.didMoveToParentViewController(self)
    }
    
    func removeImmediatelyFromParentViewController() {
        willMoveToParentViewController(nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}
