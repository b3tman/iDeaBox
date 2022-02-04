//
//  DataAssembly.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Swinject

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherRepository.self) { r in
            return WeatherRepositoryImpl()
        }
        .inObjectScope(.container)

        container.register(GeolocationRepository.self) { r in
            return GeolocationRepositoryImpl()
        }
        .inObjectScope(.container)
    }
}
