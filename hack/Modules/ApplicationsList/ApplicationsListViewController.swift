//
//  ApplicationsListViewController.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit
import SnapKit

final class ApplicationsListViewController: BaseViewController {
    
    // MARK: - Properties
    
    var output: ApplicationsListViewOutput?
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: obtainCollectionViewLayout())
        view.backgroundColor = Colors.white.color
        view.contentInset = .init(top: .zero, left: .zero, bottom: 16.0, right: .zero)
        view.register(ApplicationsListCell.self,
                      forCellWithReuseIdentifier: ApplicationsListPresenter.Constants.listCellIdentifier.rawValue)
        return view
    }()
    
    private lazy var filterBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "filter"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(filterBarButtonTapped))
        button.tintColor = Colors.black.color
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.reloadCollectionView()
    }
    
    // MARK: - Setup
    
    override func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Text.ApplicationsList.title
        navigationItem.rightBarButtonItem = filterBarButton
    }
    
    override func configureView() {
        super.configureView()
        view.addSubview(collectionView)
    }
    
    override func configureContraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func obtainCollectionViewLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10.0
        let height: CGFloat = 200.0
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(height))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = .init(leading: nil, top: .fixed(spacing), trailing: nil, bottom: .fixed(spacing))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    // MARK: - Actions
    
    @objc private func filterBarButtonTapped() {
        output?.showFilters()
    }
}

// MARK: - ApplicationsListViewInput

extension ApplicationsListViewController: ApplicationsListViewInput {
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
}

// MARK: - ApplicationListTransitionable

extension ApplicationsListViewController: ApplicationListTransitionable {
    func presentFilters(_ vc: ApplicationsFilterViewController) {
        present(vc, animated: true)
    }
}
