//
//  Case3Model.swift
//  DiffablePractice
//
//  Created by 권현석 on 2023/09/15.
//

import Foundation

struct Case3Model: Hashable {
    var check: Bool
    var title: String
    var starFill: Bool
    
    var id = UUID().uuidString
}
