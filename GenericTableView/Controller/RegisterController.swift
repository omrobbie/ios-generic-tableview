//
//  RegisterController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellId = "cellId"

    lazy var tableCell: ReuseableCell = {
        let cell = ReuseableCell(style: .default, reuseIdentifier: cellId)
        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReuseableCell.self, forCellReuseIdentifier: cellId)
    }
}

extension RegisterController: UITableViewDelegate, UITableViewDataSource {

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
