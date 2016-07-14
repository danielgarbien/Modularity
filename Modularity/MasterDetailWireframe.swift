//
//  MasterDetailWireframe.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

class MasterDetailWireframe {
    
    private lazy var rootNavigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: self.masterViewController)
        navigationController.navigationBarHidden = true
        return navigationController
    }()
    private lazy var masterViewController: MasterViewController = {
        return MasterViewController(delegate: self)
    }()
}

extension MasterDetailWireframe: Wireframe {
    
    var rootViewController: UIViewController {
        return rootNavigationController
    }
}

extension MasterDetailWireframe: MasterViewControllerDelegate {
    
    func masterViewControllerDidSelectPerson(person: Person) {
        let detailViewController = DetailViewController(person: person, delegate: self)
        rootNavigationController.pushViewController(detailViewController, animated: true)
    }
}

extension MasterDetailWireframe: DetailViewControllerDelegate {
    
    func detailViewControllerDidFinish() {
        rootNavigationController.popToRootViewControllerAnimated(true)
    }
}
