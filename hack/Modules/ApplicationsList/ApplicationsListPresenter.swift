//
//  ApplicationsListPresenter.swift
//  hack
//
//  Created by Артём Поляничев on 02.12.2021.
//

import UIKit
import SnapKit

// MARK: - DashboardDataSource

enum ApplicationsListSection: CaseIterable {
    case main
}

typealias ApplicationsListSnapshot = NSDiffableDataSourceSnapshot<ApplicationsListSection, Application>
typealias ApplicationsListDataSource = UICollectionViewDiffableDataSource<ApplicationsListSection, Application>

// MARK: - DashboardPresenter

protocol ApplicationsListViewInput: AnyObject {
    func getCollectionView() -> UICollectionView
}

protocol ApplicationsListViewOutput: AnyObject {
    func reloadCollectionView()
}

final class ApplicationsListPresenter: ApplicationsListViewOutput {
    
    // MARK: - Constants
    
    enum Constants: String {
        case listCellIdentifier
    }
    
    // MARK: - Properties
    
    weak var view: ApplicationsListViewInput?
    
    private var applications = Bundle.main.decode([Application].self, from: "Applications.json")
    private lazy var datasource = makeDataSource()
    
    // MARK: - ApplicationsListViewOutput
    
    func reloadCollectionView() {
        var snapshot = ApplicationsListSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(applications)
        datasource.apply(snapshot)
    }

    // MARK: - DataSource
    
    private func makeDataSource() -> ApplicationsListDataSource {
        guard let collectionView = view?.getCollectionView() else {
            assertionFailure("View can't be nil")
            return ApplicationsListDataSource()
        }
        let dataSource = ApplicationsListDataSource(collectionView: collectionView) { (collectionView, indexPath, model) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.listCellIdentifier.rawValue,
                                                          for: indexPath) as? ApplicationsListCell
            cell?.configure(application: model)
            return cell
        }
        return dataSource
    }
}
