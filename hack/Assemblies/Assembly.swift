//
//  Assembly.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

protocol Assembly {
    associatedtype Module: UIViewController
    func configure() -> Module
}
