//
//  LearnModel.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI

struct LearnModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [VideoItem]
}

struct VideoItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
