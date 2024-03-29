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
        let gameCoordinator = GameCoordinator()
        let settingsCoordinator = SettingsCoordinator()

        addChildCoordinators([mainCoordinator, gameCoordinator, settingsCoordinator])

        tabBarController.viewControllers = [
            mainCoordinator.rootViewController,
            gameCoordinator.rootViewController,
            settingsCoordinator.rootViewController
        ]

        mainCoordinator.rootViewController.tabBarItem = TabBarItem.main.tabBarItem
        gameCoordinator.rootViewController.tabBarItem = TabBarItem.game.tabBarItem
        settingsCoordinator.rootViewController.tabBarItem = TabBarItem.settings.tabBarItem

        tabBarController.selectedIndex = 0
        tabBarController.selectedViewController = tabBarController.viewControllers?.first

        return tabBarController
    }()

    deinit {
        removeChildCoordinators(childCoordinators)
    }
}
