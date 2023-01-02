//
//  WeatherUseCase.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

final class WeatherUseCase {
    private let weatherRepository: WeatherRepository
    private let storage: StorageRepository

    init(weatherRepository: WeatherRepository, storage: StorageRepository) {
        self.weatherRepository = weatherRepository
        self.storage = storage
    }

    func loadWeather(completion: @escaping WeatherCallback<WeatherModel>) {
        weatherRepository.forecastCurrent { [weak self] result in
            switch result {
            case .success(let weather):
                self?.storage.saveWeather(weatherModel: weather)
                completion(.success(weather))
            case .failure(let error):
                if let cachedWeather = self?.storage.fetchWeather() {
                    completion(.success(cachedWeather))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }

    func refreshWeather(completion: @escaping WeatherCallback<WeatherModel>) {
        weatherRepository.forecastCurrent(completion: completion)
    }
}
