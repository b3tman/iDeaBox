//
//  MainViewModel.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 2.02.22.
//

import Foundation
import Combine

final class MainViewModel: BaseViewModel {

    private let weatherUseCase: WeatherUseCase

    private(set) var temperature = PassthroughSubject<Double, Never>()

    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        super.init()
    }

    override func reloadState() {
        loadWeather()
    }

    func refresh() {
        loadWeather()
    }

    //MARK: - Private

    private func loadWeather() {
        state.send(.loading)
        weatherUseCase.loadWeather { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let weather):
                self.state.send(.content)
                self.temperature.send(weather.main.temp)
            case .failure:
                self.state.send(.error)
            }
        }
    }
}
