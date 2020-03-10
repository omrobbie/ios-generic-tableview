//
//  ProgrammaticallyController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ProgrammaticallyController: UIViewController {

    let cellId = "cellId"

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.register(ReuseableCell.self, forCellReuseIdentifier: cellId)

        return tv
    }()

    // No need to create the ProgrammaticallyCell because the contents are the same.
    lazy var tableCell: ReuseableCell = {
        let cell = ReuseableCell(style: .default, reuseIdentifier: cellId)
        return cell
    }()

    var txtTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .lightGray
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lbl.text = "Programmatically"

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

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: txtTitle.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension ProgrammaticallyController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ReuseableCell
        let item = Person.persons[indexPath.row]

        cell.txtFirstName.text = item.firstName
        cell.txtLastName.text = item.lastName

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = Person.persons[indexPath.row]
        let message = "\(item.firstName) \(item.lastName)"

        alertMessage(message: message, sender: self)
    }
}
