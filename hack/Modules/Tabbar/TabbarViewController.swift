//
//  TabbarViewController.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import UIKit

final class TabbarViewController: UITabBarController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Setup
    
    private func configureView() {
        view.backgroundColor = Colors.white.color
        tabBar.tintColor = Colors.main.color
    }
    
    // MARK: - Configure
    
    func configure(viewContollers: [UIViewController]) {
        setViewControllers(viewContollers, animated: false)
    }
}
