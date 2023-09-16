//
//  ViewController.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var registeration: UICollectionView.CellRegistration<UICollectionViewCell, User>!
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Int, User>!
    
    let list = [
        User(name: "새우", age: 1),
        User(name: "소금구이", age: 2),
        User(name: "새우튀김", age: 3)
    ]
    
    let list2 = [
        User(name: "고구마", age: 1),
        User(name: "고구마스틱", age: 2),
        User(name: "고구마튀김", age: 3)
    ]
    
    let list3 = [
        User(name: "광어회", age: 1),
        User(name: "광어 지느러미 초밥", age: 2),
        User(name: "매운탕", age: 3)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        registeration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.age)"
            
            cell.contentConfiguration = content
        })
        
        
    
        
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.registeration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Int, User>()
        snapShot.appendSections([0, 1, 2])
        snapShot.appendItems(list)
        snapShot.appendItems(list3)
        snapShot.appendItems(list2)
        
        diffableDataSource.apply(snapShot)

        
    }
    
    
    static func layout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        configuration.backgroundColor = .gray
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
}
