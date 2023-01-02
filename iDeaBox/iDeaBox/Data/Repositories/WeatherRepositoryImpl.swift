//
//  WeatherRepositoryImpl.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation
import Moya

typealias ResultCallback<T, E: Error> = (Result<T, E>) -> Void
typealias ResultCompletion<T> = ResultCallback<T, Error>
typealias VoidResultCompletion = ResultCallback<Void, Error>
typealias WeatherCallback<T> = (_ result: Result<T, WeatherNetworkError>) -> Void

final class WeatherRepositoryImpl: WeatherRepository {

    private let api: MoyaProvider<WeatherAPI>
    private var activeWeatherRequest: Cancellable?
    private let geolocationRepository: GeolocationRepository

    init(api: MoyaProvider<WeatherAPI>, geolocationRepository: GeolocationRepository) {
        self.api = api
        self.geolocationRepository = geolocationRepository
    }

    #warning("TODO: Add getting lat and lon!")
    func forecastCurrent(completion: @escaping WeatherCallback<WeatherModel>) {

        if let request = activeWeatherRequest, !request.isCancelled {
            request.cancel()
        }

        let lat = "53.906734"
        let lon = "27.473599"

        activeWeatherRequest = api.request(.forecastCurrent(lat: lat, lon: lon), completion: { [weak self] result in
            guard let self = self else { return }

            self.activeWeatherRequest = nil

            switch result {
            case .success(let response):
                guard let forecastDayModel = try? response.map(WeatherModel.self) else {
                    return completion(.failure(.mappingError))
                }
                completion(.success(forecastDayModel))
            case .failure(let error):
                let networkError = self.mapMoyaError(error)
                completion(.failure(networkError))
            }
        })
    }


    //MARK: - Private

    private func mapMoyaError(_ error: MoyaError) -> WeatherNetworkError {
        switch error {
        case .underlying(let nsError as NSError, _):
            if nsError.code == NSURLErrorNotConnectedToInternet
                || nsError.code == NSURLErrorTimedOut {
                return .global(.noInternerConnection)
            }
        default:
            break
        }

        guard let statusCode = error.response?.statusCode else {
            return .unknown
        }

        switch statusCode {
        case 401:
            return .invalidAPIKey
        case 404:
            return .notFound
        case 429:
            return .callsLimit
        case 500:
            return .serverError
        default:
            return .unknown
        }
    }
}
