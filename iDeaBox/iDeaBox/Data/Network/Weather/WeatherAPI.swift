//
//  WeatherAPI.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Moya

enum WeatherAPI {
    case forecastCurrent(lat: String, lon: String)
    case forecastFiveDays(lat: String, lon: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL { return URL(string: Constants.WeatherConstants.baseURL)! }
    var path: String {
        switch self {
        case .forecastCurrent:
            return "/data/2.5/weather"
        case .forecastFiveDays:
            return "/data/2.5/forecast"
        }
    }

    var method: Moya.Method {
        switch self {
        case .forecastCurrent, .forecastFiveDays:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .forecastCurrent(let lat, let lon), .forecastFiveDays(let lat, let lon):
            let parameters = [
                "lat": lat,
                "lon": lon,
                "appid": Constants.WeatherConstants.apiKey,
                "units": "metric"
            ]
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
        }
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
