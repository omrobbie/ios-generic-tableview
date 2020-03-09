//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class GenericTableView<U, T: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {

    let cellId = "cellId"

    var items: [U]!
    var setupCell: (U, T) -> ()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, items: [U], setupCell: @escaping (U, T) -> ()) {
        self.items = items
        self.setupCell = setupCell
        super.init(frame: frame, style: .plain)

        delegate = self
        dataSource = self
        register(T.self, forCellReuseIdentifier: cellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! T
        setupCell(items[indexPath.row], cell)

        return cell
    }
}
