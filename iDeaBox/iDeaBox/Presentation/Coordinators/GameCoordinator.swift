//
//  GameCoordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 3.01.23.
//

import UIKit

final class GameCoordinator: RootViewCoordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController! = {
        let gameViewController = GameViewController()
        let gameNavigationController = BaseNavigationController(rootViewController: gameViewController)
        return gameNavigationController
    }()

    deinit {
        removeChildCoordinators(childCoordinators)
    }
}
