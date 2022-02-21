//
//  DomainAssembly.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Swinject

final class DomainAssembly: Assembly {
    func assemble(container: Container) {

        container.register(WeatherUseCase.self) { r in
            return WeatherUseCase(weatherRepository: r.resolve(WeatherRepository.self)!)
        }
    }
}
