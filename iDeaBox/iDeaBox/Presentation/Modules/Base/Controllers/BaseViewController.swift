//
//  BaseViewController.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 2.02.22.
//

import UIKit
import Combine

enum ViewState {
    case content
    case loading
    case error
}

class BaseViewController<T: BaseViewModel>: UIViewController {

    var viewModel: T!
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        subscribeViewState()
    }

    func set(_ state: ViewState) {
        switch state {
        case .content:
            setContentState()
        case .loading:
            setLoadingState()
        case .error:
            setErrorState()
        }
    }

    //MARK: - Private

    private func subscribeViewState() {
        viewModel?.state.sink { [weak self] state in
            self?.set(state)
        }.store(in: &cancellables)
    }

    private func setContentState() {
        // remove placeholder
    }

    private func setLoadingState() {

    }

    private func setErrorState() {

    }
}
