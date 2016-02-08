//
//  MasterViewController.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate {
    
    func masterViewControllerDidSelectPerson(person: Person)
}

class MasterViewController: UIViewController {
    
    var delegate: MasterViewControllerDelegate?
    
    private lazy var tableView = UITableView()
    private let dataSource = MasterDataSource()
    
    init(delegate: MasterViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = tableView
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MasterViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.masterViewControllerDidSelectPerson(dataSource.personAtIndexPath(indexPath))
    }
}
