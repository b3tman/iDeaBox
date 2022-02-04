//
//  MainViewModel.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 2.02.22.
//

import Foundation

final class MainViewModel: BaseViewModel {

    private let weatherUseCase: WeatherUseCase

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
    }
}
