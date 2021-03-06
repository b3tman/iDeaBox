//
//  WeatherRepository.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

protocol WeatherRepository {
    func forecastCurrent(completion: @escaping WeatherCallback<WeatherModel>)
}
