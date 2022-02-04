//
//  WeatherUseCase.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

final class WeatherUseCase {

    private let weatherRepository: WeatherRepository
    private let geolocationRepository: GeolocationRepository

    init(weatherRepository: WeatherRepository, geolocationRepository: GeolocationRepository) {
        self.weatherRepository = weatherRepository
        self.geolocationRepository = geolocationRepository
    }

    func loadWeather() {

    }

    func refreshWeather() {

    }
}
