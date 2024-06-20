//
//  ViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        ApiCaller.shared.getMostEmailed()
    }


}

