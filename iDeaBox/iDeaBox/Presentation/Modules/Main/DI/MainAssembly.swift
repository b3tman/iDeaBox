//
//  MainAssembly.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Swinject

final class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainViewModel.self) { r in
            return MainViewModel(weatherUseCase: r.resolve(WeatherUseCase.self)!)
        }
    }
}
