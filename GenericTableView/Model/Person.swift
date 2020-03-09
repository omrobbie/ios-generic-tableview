//
//  Person.swift
//  GenericTableView
//
//  Created by omrobbie on 09/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class Person {

    private(set) var firstName: String
    private(set) var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    static let persons: [Person] = [
        Person(firstName: "Putu", lastName: "Roby"),
        Person(firstName: "Kusuma", lastName: "Dewi"),
        Person(firstName: "Ngurah", lastName: "Putra")
    ]
}
