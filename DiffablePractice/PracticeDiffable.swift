//
//  PracticeDiffable.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/16.
//

import UIKit
import SnapKit

class PracticeDiffable: UIViewController {
    
    var list = [
    User(name: "이제", age: 0),
    User(name: "좀", age: 1),
    User(name: "익숙해", age: 2),
    User(name: "짐", age: 3),
    ]
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Int, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dataSourceConfig()
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        
        diffableDataSource.apply(snapshot)
        
    }
    
    private func dataSourceConfig() {
        
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, User> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.font = .systemFont(ofSize: 30, weight: .heavy)
            content.textProperties.color = .systemTeal
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .systemBlue
            cell.backgroundConfiguration = backgroundConfig
        }
        
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
    }
    
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .lightGray
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}
