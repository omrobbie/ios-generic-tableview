//
//  ViewController.swift
//  GenericTableView
//
//  Created by omrobbie on 08/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class StoryboardController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension StoryboardController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.textLabel?.text = "item \(indexPath.row)"

        return cell
    }
}
