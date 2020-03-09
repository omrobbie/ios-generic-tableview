//
//  GenericController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class GenericController: UIViewController {

    var tableView: GenericTableView<Person, UITableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = GenericTableView(frame: view.frame, items: Person.persons, setupCell: { (item, cell) in
            cell.textLabel?.text = item.firstName
        })

        view.addSubview(tableView)
    }
}
