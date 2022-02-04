//
//  BaseViewModel.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 2.02.22.
//

import Foundation
import Combine

class BaseViewModel {
    var state = PassthroughSubject<ViewState, Never>()

    // MARK: - Methods to override

    func reloadState() {
        assert(false, "'tryAgain' method not implemented")
    }
}
