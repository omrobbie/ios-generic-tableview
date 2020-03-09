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

    var tableView: UITableView!

    // No need to create the ProgrammaticallyCell because the contents are the same.
    lazy var tableCell: ReuseableCell = {
        let cell = ReuseableCell(style: .default, reuseIdentifier: cellId)
        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let displayWidth: CGFloat = view.frame.width
        let displayHeight: CGFloat = view.frame.height

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ReuseableCell.self, forCellReuseIdentifier: cellId)

        view.addSubview(tableView)
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
