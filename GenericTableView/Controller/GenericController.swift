//
//  GenericController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class GenericController: UIViewController {

    var tableView: GenericTableView<Person, ReuseableCell>!

    var txtTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .lightGray
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lbl.text = "Generic"

        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(txtTitle)
        NSLayoutConstraint.activate([
            txtTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            txtTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            txtTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            txtTitle.heightAnchor.constraint(equalToConstant: 64)
        ])

        tableView = GenericTableView(frame: view.frame, items: Person.persons, setupCell: { (item, cell) in
            cell.txtFirstName.text = item.firstName
            cell.txtLastName.text = item.lastName
        }, onSelectedItem: { (item) in
            let message = "\(item.firstName) \(item.lastName)"
            alertMessage(message: message, sender: self)
        })

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: txtTitle.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
