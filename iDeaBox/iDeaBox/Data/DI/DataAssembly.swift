//
//  DataAssembly.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Swinject
import Moya

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MoyaProvider<WeatherAPI>.self) { _ in
            return MoyaProvider<WeatherAPI>()
        }
        .inObjectScope(.container)

        container.register(WeatherRepository.self) { r in
            return WeatherRepositoryImpl(api: r.resolve(MoyaProvider<WeatherAPI>.self)!,
                                         geolocationRepository: r.resolve(GeolocationRepository.self)!)
        }
        .inObjectScope(.container)

        container.register(GeolocationRepository.self) { r in
            return GeolocationRepositoryImpl()
        }
        .inObjectScope(.container)

        container.register(SharedStorageRepository.self) { r in
            return SharedStorageRepository(modelName: Constants.Keys.modelName)
        }
        .inObjectScope(.container)
    }
}
