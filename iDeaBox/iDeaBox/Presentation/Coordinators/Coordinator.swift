//
//  Coordinator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

typealias RootViewCoordinator = Coordinator & RootViewControllerProvider

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

protocol RootViewControllerProvider: AnyObject {
    var rootViewController: UIViewController! { get }
    var navigationViewController: UINavigationController! { get }
}

extension RootViewControllerProvider {
    var navigationViewController: UINavigationController! {
        rootViewController as? UINavigationController
    }
}

extension Coordinator {
    public func addChildCoordinators(_ childCoordinators: [Coordinator]) {
        childCoordinators.forEach({ addChildCoordinator($0) })
    }

    public func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }

    public func removeChildCoordinators(_ childCoordinators: [Coordinator]) {
        childCoordinators.forEach({ removeChildCoordinator($0) })
    }

    public func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
