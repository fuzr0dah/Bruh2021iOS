//
//  ProfileAssembly.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import SwiftUI

final class ProfileAssembly: Assembly {
    func configure() -> UIViewController {
        let view = ProfileView()
        let vc = UIHostingController(rootView: view)
        vc.tabBarItem = UITabBarItem(title: "Профиль", image: Assets.profile.image, tag: 1)
        return vc
    }
}
