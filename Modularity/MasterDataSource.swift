//
//  MasterDataSource.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"

class MasterDataSource: NSObject {
    
    private let people: [Person] = [
        Person(name: "Jimmy", imageName: "jimmy"),
        Person(name: "Jimi", imageName: "jimi"),
        Person(name: "Jamie", imageName: "jamie"),
        Person(name: "Jim", imageName: "jim")
    ]
    
    func personAtIndexPath(indexPath: NSIndexPath) -> Person {
        return people[indexPath.row]
    }
}

extension MasterDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = personAtIndexPath(indexPath).name
        return cell
    }
}
