//
//  AppDelegate.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let assembler = Assembler()
    private(set) lazy var coordinator = AppCoordinator(window: window ?? UIWindow())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppConfigurator.applicationStarted(with: launchOptions)

        window = UIWindow()
        coordinator.start(launchOptions: launchOptions)

        return true
    }
}

// MARK: - Dependency
extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    static func getDependency<T>(type: T.Type) -> T? {
        AppDelegate.shared.assembler.resolver.resolve(T.self)
    }

    static func getAssembler() -> Assembler {
        AppDelegate.shared.assembler
    }
}
