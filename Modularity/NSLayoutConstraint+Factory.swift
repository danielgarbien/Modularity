//
//  NSLayoutConstraint+Factory.swift
//  Modularity
//
//  Created by Daniel Garbień on 23/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    static func activateConstraintsForItem(item: AnyObject, withEqualFrameAsItem secondItem: AnyObject) {
        activateConstraints(
            constraintsForItem(
                item,
                withEqualAttributes: [.Left, .Right, .Top, .Bottom],
                toItem: secondItem)
        )
    }
    
    static func constraintsForItem(item: AnyObject, withEqualAttributes attributes: [NSLayoutAttribute], toItem: AnyObject) -> [NSLayoutConstraint] {
        return attributes.map {
            return self.init(item: item, attribute: $0, relatedBy: .Equal, toItem: toItem, attribute: $0, multiplier: 1, constant: 0)
        }
    }
}
