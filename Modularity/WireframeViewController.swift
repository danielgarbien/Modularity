//
//  WireframeViewController.swift
//  Modularity
//
//  Created by Daniel Garbień on 23/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

protocol Wireframe {
    
    var rootViewController: UIViewController { get }
}

class WireframeViewController: UIViewController {
    
    private let wireframe: Wireframe
    
    init(wireframe: Wireframe) {
        self.wireframe = wireframe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImmediatelyChildViewController(wireframe.rootViewController, embeddedInView: view)
    }
}
