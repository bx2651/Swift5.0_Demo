//
//  SwiftHashTags.swift
//  SwiftHashTags
//
//  Created by baixue on 3/20/2020.
//

import Foundation

public struct SwiftHashTags: Codable {
    let title: String
    let id: Int
    
    public init(title: String, id: Int) {
        self.title = title
        self.id = id
    }
}
