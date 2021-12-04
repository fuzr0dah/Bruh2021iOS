//
//  ApplicationsListAssembly.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

final class ApplicationsListAssembly: Assembly {
    func configure() -> ApplicationsListViewController {
        let view = ApplicationsListViewController()
        let presenter = ApplicationsListPresenter()
        let router = ApplicationListRouter()
        
        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter
        
        view.tabBarItem = UITabBarItem(title: Text.Tabbar.aspplications, image: Assets.shuttle.image, tag: 0)
        
        return view
    }
}
