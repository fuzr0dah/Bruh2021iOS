//
//  ApplicationsListAssembly.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import Foundation

final class ApplicationsListAssembly: Assembly {
    func configure() -> ApplicationsListViewController {
        let view = ApplicationsListViewController()
        let presenter = ApplicationsListPresenter()
        
        presenter.view = view
        view.output = presenter
        
        return view
    }
}
