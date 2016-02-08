//
//  DetailViewController.swift
//  Modularity
//
//  Created by Daniel Garbień on 01/02/16.
//  Copyright © 2016 Daniel Garbień. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    
    func detailViewControllerDidFinish()
}

class DetailViewController: UIViewController {
    
    var delegate: DetailViewControllerDelegate?

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var button: UIButton!
    
    private let person: Person
    
    init(person: Person, delegate: DetailViewControllerDelegate?) {
        self.person = person
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewWithPerson(person)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailViewController {
    
    func updateViewWithPerson(person: Person) {
        titleLabel.text = "Hi \(person.name)!"
        button.setTitle("Bye \(person.name).", forState: .Normal)
        imageView.image = UIImage(named: person.imageName)
    }
    
    @IBAction func buttonTapped() {
        delegate?.detailViewControllerDidFinish()
    }
}
