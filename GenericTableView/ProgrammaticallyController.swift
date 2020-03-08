//
//  ProgrammaticallyController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ProgrammaticallyController: UIViewController {

    var tableView = UITableView()
    let id = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        let displayWidth: CGFloat = view.frame.width
        let displayHeight: CGFloat = view.frame.height

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)

        view.addSubview(tableView)
    }
}

extension ProgrammaticallyController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) else {return UITableViewCell()}
        cell.textLabel?.text = "Programmatically item \(indexPath.row)"

        return cell
    }
}
