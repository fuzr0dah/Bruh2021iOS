//
//  ReviewView.swift
//  hack
//
//  Created by Артём Поляничев on 03.12.2021.
//

import UIKit

final class ReviewView: UIView {
    
    // MARK: - Appearance

    private struct Appearance { }

    // MARK: - Properties

    private let appearance = Appearance()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.ReviewView.interesting
        label.font = .systemFont(ofSize: 12.0)
        label.textAlignment = .center
        label.textColor = Colors.green.color
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 2.0
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func configureView() {
        addSubviews(titleLabel, stackView)
        generateViews()
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    
    private func generateViews() {
        let colors = [Colors.red.color, Colors.yellow.color, Colors.green.color]
        for color in colors {
            let view = UIView()
            view.backgroundColor = color
            view.layer.cornerRadius = 3.0
            view.snp.makeConstraints { make in
                make.width.equalTo(36.0)
                make.height.equalTo(6.0)
            }
            stackView.addArrangedSubview(view)
        }
    }
}
