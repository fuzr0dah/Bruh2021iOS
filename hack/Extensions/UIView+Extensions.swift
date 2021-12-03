//
//  UIView+Extensions.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
