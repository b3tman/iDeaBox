//
//  Errors.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

enum GlobalError: Error {
    case noInternerConnection

    var description: String {
        switch self {
        case .noInternerConnection:
            return "Common error"
        }
    }
}

enum WeatherNetworkError: Error {
    case global(GlobalError)
    case mappingError
    case invalidAPIKey
    case notFound
    case callsLimit
    case serverError
    case unknown

    var description: String {
        switch self {
        case .global(let globalError):
            return globalError.description
        case .mappingError:
            return "Mapping error"
        case .invalidAPIKey:
            return "Invalid key error"
        case .notFound:
            return "not found"
        case .callsLimit:
            return "calls limit"
        case .serverError:
            return "server limit"
        case .unknown:
            return "unknown"
        }
    }
}
