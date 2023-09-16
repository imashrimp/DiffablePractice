//
//  DiffableCase3.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/15.
//

import UIKit
import SnapKit

final class DiffableCase3ViewController: UIViewController {
    
    let list = [
        Case3Model(check: true, title: "그립톡 구매하기", starFill: false),
        Case3Model(check: false, title: "사이다 구매", starFill: true),
        Case3Model(check: false, title: "아이패드 최저가 알아보기", starFill: true),
        Case3Model(check: false, title: "양말", starFill: false)
    ]
    
    var d3CollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

    var diffableDataSource: UICollectionViewDiffableDataSource<Int, Case3Model>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(d3CollectionView)
        d3CollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
              
        var snapshot = NSDiffableDataSourceSnapshot<Int, Case3Model>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        diffableDataSource.apply(snapshot)
    }
    
    private func configureDataSource() {
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, Case3Model>(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.image = itemIdentifier.check ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
            content.imageProperties.tintColor = .systemGreen
            content.text = itemIdentifier.title
            content.imageToTextPadding = 20
            
            cell.contentConfiguration = content
            
        })
        
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: d3CollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
   static private func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
       configuration.showsSeparators = false
       configuration.backgroundColor = .systemGreen
       
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
}
