//
//  ApplicationsListCell.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit
import SnapKit

final class ApplicationsListCell: UICollectionViewCell {
    
    // MARK: - Appearance

    private struct Appearance {
        let descLabelNumberOfLines = 3
        let containerShadowOffset = CGSize(width: .zero, height: 2.0)
        let containerShadowOpacity: Float = 0.1
        let containerShadowRadius: CGFloat = 5.0
        let containerCornerRadius: CGFloat = 8.0
        let containerInsets = UIEdgeInsets(top: 4.0, left: 16.0, bottom: 4.0, right: 16.0)
    }

    // MARK: - Properties

    private let appearance = Appearance()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = Assets.noImage.image
        view.contentMode = .scaleAspectFill
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = appearance.containerCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = Colors.white.color
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.numberOfLines = appearance.descLabelNumberOfLines
        return label
    }()
    
    private lazy var reviewView: ReviewView = {
        let view = ReviewView()
        return view
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Bool.random() ? "star" : "star.fill"), for: .normal)
        button.tintColor = Colors.black.color
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.white.color
        view.layer.cornerRadius = appearance.containerCornerRadius
        view.layer.shadowColor = Colors.black.color.cgColor
        view.layer.shadowOffset = appearance.containerShadowOffset
        view.layer.shadowOpacity = appearance.containerShadowOpacity
        view.layer.shadowRadius = appearance.containerShadowRadius
        view.addSubviews(imageView, titleLabel, descLabel, reviewView, favoriteButton)
        return view
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
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 2.0
    }
    
    // MARK: - Setup
    
    private func configureView() {
        contentView.addSubview(containerView)
    }

    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(100.0)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(-32.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        reviewView.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(8.0)
            make.left.equalToSuperview().offset(16.0)
            make.bottom.equalToSuperview().offset(-16.0)
        }
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(8.0)
            make.right.equalToSuperview().offset(-16.0)
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.containerInsets)
        }
    }
    
    // MARK: - Configure
    
    func configure(application: Application) {
        titleLabel.text = application.name
        descLabel.text = application.desc
        imageView.image = application.imageName.isEmpty ? Assets.noImage.image : UIImage(named: application.imageName)
    }
    
    // MARK: - Actions
    
    @objc private func favoriteButtonTapped() {
        // TODO: Add action
    }
}
