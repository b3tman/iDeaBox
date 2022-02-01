//
//  AppCoordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

final class AppCoordinator: RootViewCoordinator {

    private let window: UIWindow

    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController!

    required init(window: UIWindow) {
        self.window = window
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    deinit {
        removeChildCoordinators(childCoordinators)
    }

    func start(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        startLaunching(launchOptions: launchOptions)
    }
}

private extension AppCoordinator {
    func prepareStart() {
        prepareTabBarCoordinator()
    }

    func startLaunching(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // handle launch options or implement custom launch screen animation
        prepareStart()
    }

    func prepareTabBarCoordinator() {
        let tabBarCoordinator = TabBarCoordinator()
        self.addChildCoordinator(tabBarCoordinator)
        window.rootViewController = tabBarCoordinator.rootViewController
    }
}
