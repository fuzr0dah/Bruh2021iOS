//
//  LoginAssembly.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import UIKit

final class LoginAssembly: Assembly {
    func configure() -> LoginViewController {
        guard let vc = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController else {
            fatalError("Can't instantiate LoginViewController")
        }
        return vc
    }
}
