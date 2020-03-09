//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class GenericTableView<T: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {

    let cellId = "cellId"

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        delegate = self
        dataSource = self
        register(T.self, forCellReuseIdentifier: cellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! T
        cell.textLabel?.text = "Generic item \(indexPath.row)"

        return cell
    }
}
