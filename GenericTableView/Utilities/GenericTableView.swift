//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class GenericTableView<Item, Cell: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {

    let cellId = "cellId"

    var items: [Item]!
    var setupCell: (Item, Cell) -> ()
    var onSelectedItem: (Item) -> ()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, items: [Item], setupCell: @escaping (Item, Cell) -> (), onSelectedItem: @escaping (Item) -> ()) {
        self.items = items
        self.setupCell = setupCell
        self.onSelectedItem = onSelectedItem
        super.init(frame: frame, style: .plain)

        delegate = self
        dataSource = self
        register(Cell.self, forCellReuseIdentifier: cellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! Cell
        setupCell(items[indexPath.row], cell)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectedItem(items[indexPath.row])
    }
}
