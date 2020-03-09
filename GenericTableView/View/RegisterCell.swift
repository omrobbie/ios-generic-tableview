//
//  RegisterCell.swift
//  GenericTableView
//
//  Created by omrobbie on 09/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class RegisterCell: UITableViewCell {

    let txtFirstName = UILabel()
    let txtLastName = UILabel()

    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [txtFirstName, txtLastName])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.spacing = 20

        return sv
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor)
        ])
    }
}
