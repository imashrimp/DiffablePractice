//
//  Model.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/15.
//

import Foundation

struct User: Hashable {
    var id = UUID().uuidString
    var name: String
    var age: Int
}
