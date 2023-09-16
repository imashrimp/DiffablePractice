//
//  DiffableCase2.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/15.
//

import UIKit
import SnapKit

class DiffableCase2ViewController: UIViewController {
    
    enum Section: CaseIterable {
        case one, two, three
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
//    var registeration: UICollectionView.CellRegistration<UICollectionViewListCell, Case2Model>!
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Section, Case2Model>!
    
    let list = [
    Case2Model(text: "공지사항"),
    Case2Model(text: "실험실"),
    Case2Model(text: "버전정보")
    ]
    
    let list2 = [
    Case2Model(text: "개인/보안"),
    Case2Model(text: "알림"),
    Case2Model(text: "채팅"),
    Case2Model(text: "멀티프로필")
    ]
    
    let list3 = [
    Case2Model(text: "고객센터/도움말")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()

        var snapShot = NSDiffableDataSourceSnapshot<Section, Case2Model>()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(list, toSection: Section.one)
        snapShot.appendItems(list2, toSection: Section.two)
        snapShot.appendItems(list3, toSection: Section.three)
        
        diffableDataSource.apply(snapShot)
    }
    
    private func configureDataSource() {
        
        let registeration = UICollectionView.CellRegistration<UICollectionViewListCell, Case2Model>(handler: { cell, indexPath, itemIdentifier in
            var configuration = UIListContentConfiguration.valueCell()
            configuration.text = itemIdentifier.text
            
            cell.contentConfiguration = configuration
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemBlue
            cell.backgroundConfiguration = backgroundConfig
        })
        
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
          
            let cell = collectionView.dequeueConfiguredReusableCell(using: registeration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
    private static func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
}

