//
//  LoginViewController.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var registerButton: UIButton!
    
    // MARK: - Setup
    
    override func configureView() {
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = Colors.main.color.cgColor
        registerButton.backgroundColor = .clear
        registerButton.setTitleColor(Colors.main.color, for: .normal)
        registerButton.setTitleColor(.lightGray, for: .selected)
        registerButton.layer.cornerRadius = 25.0
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
    }
    
    // MARK: - Actions
    
    @IBAction private func loginButtonTapped(_ sender: Any) {
        let vc = TabbarAssembly().configure()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
