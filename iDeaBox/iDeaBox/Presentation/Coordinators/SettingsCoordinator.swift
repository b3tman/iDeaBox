//
//  SettingsCoordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

final class SettingsCoordinator: RootViewCoordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController! = {
        let settingsViewController = SettingsViewController()
        let settingsNavigationController = BaseNavigationController(rootViewController: settingsViewController)
        return settingsNavigationController
    }()

    deinit {
        removeChildCoordinators(childCoordinators)
    }
}
