//
//  StorageRepository.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 7.03.22.
//

import Foundation

protocol StorageRepository {
    func saveWeather(weatherModel: WeatherModel)
    func fetchWeather() -> WeatherModel?
}
