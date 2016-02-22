//
//  UIView+LayoutExtensions.swift
//  Modularity
//
//  Created by Daniel Garbień on 23/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit 

extension UIView {
    
    func embedSubview(view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraintsForItem(view, withEqualFrameAsItem: self)
    }
}
