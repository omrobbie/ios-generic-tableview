//
//  AlertMessage.swift
//  GenericTableView
//
//  Created by omrobbie on 09/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

func alertMessage(message: String, sender: UIViewController) {
    let alertController = UIAlertController(title: "You choose", message: message, preferredStyle: .alert)
    let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)

    alertController.addAction(actionOk)

    sender.present(alertController, animated: true, completion: nil)
}
