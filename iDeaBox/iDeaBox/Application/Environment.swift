//
//  Environment.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 4.02.22.
//

import Foundation

enum Plist: String {
    case apiKey = "API_KEY"
    case baseURL = "BASE_URL"
}

struct Environment {
    func configuration(for key: Plist) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            fatalError("Unable to load info.plist file")
        }

        return infoDictionary[key.rawValue] as? String ?? ""
    }
}
