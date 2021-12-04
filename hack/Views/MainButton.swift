//
//  MainButton.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import UIKit

final class MainButton: UIButton {
    init() {
        super.init(frame: .zero)
        prepareView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2.0
    }
    
    private func prepareView() {
        backgroundColor = Colors.main.color
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .selected)
        titleLabel?.font = .boldSystemFont(ofSize: 16.0)
    }
}
