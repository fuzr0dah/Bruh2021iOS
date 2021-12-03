//
//  BaseViewController.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        configureContraints()
    }
    
    // MARK: - Setup
    
    func configureNavigationBar() { }

    func configureView() {
        view.backgroundColor = Colors.white.color
    }
    
    func configureContraints() { }
}
