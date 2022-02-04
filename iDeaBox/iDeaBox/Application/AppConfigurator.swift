//
//  AppConfigurator.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Swinject

final class AppConfigurator {
    static func applicationStarted(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setupAssembly()
    }

    //MARK: - Private

    private static func setupAssembly() {
        AppDelegate.getAssembler().apply(assemblies: [
            DataAssembly(),
            DomainAssembly(),
            MainAssembly()
        ])
    }
}
