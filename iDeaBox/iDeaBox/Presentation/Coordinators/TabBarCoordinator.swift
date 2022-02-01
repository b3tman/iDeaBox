//
//  TabBarCoordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

final class TabBarCoordinator: RootViewCoordinator {
    var childCoordinators: [Coordinator] = []

    lazy var rootViewController: UIViewController! = {
        let tabBarController = TabBarController()

        let mainCoordinator = MainCoordinator()
        let settingsCoordinator = SettingsCoordinator()

        addChildCoordinators([mainCoordinator, settingsCoordinator])

        tabBarController.viewControllers = [
            mainCoordinator.rootViewController,
            settingsCoordinator.rootViewController
        ]

        mainCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Main", image: nil, selectedImage: nil)
        settingsCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Settings", image: nil, selectedImage: nil)

        tabBarController.selectedIndex = 0
        tabBarController.selectedViewController = tabBarController.viewControllers?.first

        return tabBarController
    }()

    deinit {
        removeChildCoordinators(childCoordinators)
    }
}
