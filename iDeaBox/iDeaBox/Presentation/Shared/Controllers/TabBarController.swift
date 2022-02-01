//
//  TabBarController.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = UIColor.white
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = UIColor.blue
        tabBar.unselectedItemTintColor = UIColor.gray
    }
}
