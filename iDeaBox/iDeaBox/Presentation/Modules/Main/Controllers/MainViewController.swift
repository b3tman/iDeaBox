//
//  MainViewController.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

final class MainViewController: BaseViewController<MainViewModel> {

    //MARK: - Outlets
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        viewModel.reloadState()
    }

    //MARK: - Config

    private func config() {
        hideSpinner()
        setupViewModel()
    }

    //MARK: - Actions
    @IBAction func actionRefresh(_ sender: Any) {
        viewModel.refresh()
    }

    //MARK: - Override

    override func set(_ state: ViewState) {
        switch state {
        case .content:
            hideSpinner()
        case .loading:
            showSpinner()
        case .error:
            hideSpinner()
        }
    }

    //MARK: - Private

    private func setupViewModel() {
        viewModel.temperature.sink { [weak self] temperature in
            self?.temperatureLabel.text = String(temperature)
        }.store(in: &cancellables)
    }

    private func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }

    private func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
}
