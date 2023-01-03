//
//  GameAssembly.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 3.01.23.
//

import Foundation
import Swinject

final class GameAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GameViewController.self) { _ in
            return GameViewController()
        }
        container.register(GameViewModel.self) { _ in
            return GameViewModel()
        }
    }
}
