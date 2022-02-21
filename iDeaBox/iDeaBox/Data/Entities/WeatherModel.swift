//
//  WeatherModel.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

struct WeatherModel: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
