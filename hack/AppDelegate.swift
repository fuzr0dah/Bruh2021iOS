//
//  AppDelegate.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties

    var window: UIWindow?
    
    // MARK: - Lifecycle

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = LoginAssembly().configure()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
