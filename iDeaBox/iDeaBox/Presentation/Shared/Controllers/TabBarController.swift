//
//  TabBarController.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 1.02.22.
//

import UIKit

enum TabBarItem: Int {
    case main
    case game
    case settings

    var tabBarItem: UITabBarItem {
        UITabBarItem(title: title, image: nil, tag: rawValue)
    }

    var title: String? {
        switch self {
        case .main:
            return R.string.lacalizable.tabItemMain()
        case .game:
            return R.string.lacalizable.tabItemGame()
        case .settings:
            return R.string.lacalizable.tabItemSettings()
        }
    }
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSelection()
    }

    // MARK: - Private
    private func config() {
        tabBar.backgroundColor = UIColor.white
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = UIColor.blue
        tabBar.unselectedItemTintColor = UIColor.gray
        delegate = self
    }

    private func updateSelection() {
        let normalFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        let selectedFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        viewControllers?.forEach {
            let selected = $0 == self.selectedViewController
            $0.tabBarItem.setTitleTextAttributes([.font: selected ? selectedFont : normalFont], for: .normal)
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateSelection()
    }
}
