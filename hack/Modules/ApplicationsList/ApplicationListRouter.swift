//
//  ApplicationListRouter.swift
//  hack
//
//  Created by Артём Поляничев on 03.12.2021.
//

import Foundation

protocol ApplicationListTransitionable: AnyObject {
    func presentFilters(_ vc: ApplicationsFilterViewController)
}

protocol ApplicationListRouterInput: AnyObject {
    func routeToFilters()
}

final class ApplicationListRouter: ApplicationListRouterInput {

    // MARK: - Properties

    weak var view: ApplicationListTransitionable?

    // MARK: - ApplicationListRouterInput
    
    func routeToFilters() {
        let vc = ApplicationsFilterAssembly().configure()
        view?.presentFilters(vc)
    }
}
