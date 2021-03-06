//
//  MainCoordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

final class MainCoordinator: RootViewCoordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController! = {
        let mainViewController = MainViewController()
        mainViewController.viewModel = AppDelegate.getDependency(type: MainViewModel.self)!
        let mainNavigationController = BaseNavigationController(rootViewController: mainViewController)
        return mainNavigationController
    }()

    deinit {
        removeChildCoordinators(childCoordinators)
    }
}
