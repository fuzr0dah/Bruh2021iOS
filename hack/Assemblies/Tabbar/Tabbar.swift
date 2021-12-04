//
//  Tabbar.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import UIKit

final class TabbarAssembly: Assembly {
    func configure() -> TabbarViewController {
        let view = TabbarViewController()
        view.configure(viewContollers: getTabs())
        return view
    }
    
    private func getTabs() -> [UIViewController] {
        let vc = [
            ApplicationsListAssembly().configure(),
            ProfileAssembly().configure()
        ]
        return vc.map { UINavigationController(rootViewController: $0) }
    }
}
