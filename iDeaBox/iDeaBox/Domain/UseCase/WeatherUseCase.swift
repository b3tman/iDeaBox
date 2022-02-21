//
//  WeatherUseCase.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

final class WeatherUseCase {
    private let weatherRepository: WeatherRepository

    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }

    func loadWeather(completion: @escaping WeatherCallback<WeatherModel>) {
        weatherRepository.forecastCurrent(completion: completion)
    }

    func refreshWeather(completion: @escaping WeatherCallback<WeatherModel>) {
        weatherRepository.forecastCurrent(completion: completion)
    }
}
